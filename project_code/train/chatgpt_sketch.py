# ray tune hyperparameter search example with early stopping, model checkpointing
# and demonstration of loading the best model for testing.

import os
import copy
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
from torch.utils.data import DataLoader
from torchvision import datasets, transforms

import ray
from ray import tune
from ray.tune.schedulers import ASHAScheduler


# Define a simple model
class SimpleNet(nn.Module):
    def __init__(self, input_size, hidden_size, num_classes, dropout_p=0.2):
        super(SimpleNet, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.fc2 = nn.Linear(hidden_size, num_classes)
        self.dropout = nn.Dropout(p=dropout_p)

    def forward(self, x):
        x = x.view(x.size(0), -1)  # Flatten for a fully connected layer
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = self.fc2(x)
        return x


# Training function
# We'll incorporate a naive early-stopping mechanism based on validation loss.
# If it doesn't improve for 'patience' epochs, stop early.
# We'll also save checkpoints of the best model seen.

def train_mnist(config, checkpoint_dir=None, data_dir=None):
    # Hyperparameters from Ray Tune config
    hidden_size = config["hidden_size"]
    lr = config["lr"]
    dropout_p = config.get("dropout_p", 0.2)
    batch_size = config["batch_size"]
    patience = config.get("patience", 3)

    # Prepare dataset
    transform = transforms.Compose([
        transforms.ToTensor(),
        transforms.Normalize((0.1307,), (0.3081,))
    ])

    train_dataset = datasets.MNIST(root="./data", train=True, download=True, transform=transform)
    test_dataset = datasets.MNIST(root="./data", train=False, download=True, transform=transform)

    train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
    val_loader = DataLoader(test_dataset, batch_size=1000)

    model = SimpleNet(28 * 28, hidden_size, 10, dropout_p=dropout_p)
    device = "cuda" if torch.cuda.is_available() else "cpu"
    model.to(device)

    optimizer = optim.Adam(model.parameters(), lr=lr)
    criterion = nn.CrossEntropyLoss()

    # Load from checkpoint if available.
    start_epoch = 0
    best_val_loss = float("inf")
    best_model_state = copy.deepcopy(model.state_dict())

    if checkpoint_dir:
        # If we are restarting from a checkpoint.
        checkpoint = torch.load(os.path.join(checkpoint_dir, "checkpoint.pt"))
        model.load_state_dict(checkpoint["model_state"])
        optimizer.load_state_dict(checkpoint["optimizer_state"])
        start_epoch = checkpoint["epoch"] + 1
        best_val_loss = checkpoint["best_val_loss"]
        best_model_state = checkpoint["best_model_state"]

    epochs_no_improve = 0
    max_epochs = 30

    for epoch in range(start_epoch, max_epochs):
        model.train()
        running_loss = 0.0
        for images, labels in train_loader:
            images, labels = images.to(device), labels.to(device)

            optimizer.zero_grad()
            outputs = model(images)
            loss = criterion(outputs, labels)
            loss.backward()
            optimizer.step()
            running_loss += loss.item()

        # Validation
        model.eval()
        val_loss = 0.0
        correct = 0
        total = 0
        with torch.no_grad():
            for images, labels in val_loader:
                images, labels = images.to(device), labels.to(device)
                outputs = model(images)
                loss = criterion(outputs, labels)
                val_loss += loss.item()
                _, predicted = torch.max(outputs, 1)
                total += labels.size(0)
                correct += (predicted == labels).sum().item()

        val_loss /= len(val_loader)
        accuracy = 100.0 * correct / total

        # Update best model & checkpoint if improved
        if val_loss < best_val_loss:
            best_val_loss = val_loss
            best_model_state = copy.deepcopy(model.state_dict())
            epochs_no_improve = 0

            # Save checkpoint
            with tune.checkpoint_dir(epoch) as checkpoint_dir:
                path = os.path.join(checkpoint_dir, "checkpoint.pt")
                torch.save({
                    "epoch": epoch,
                    "model_state": model.state_dict(),
                    "optimizer_state": optimizer.state_dict(),
                    "best_val_loss": best_val_loss,
                    "best_model_state": best_model_state
                }, path)
        else:
            epochs_no_improve += 1

        # Report metrics to Ray Tune
        tune.report(loss=val_loss, accuracy=accuracy)

        # Early stopping check
        if epochs_no_improve >= patience:
            break

    # End of training - restore best model state if not already set
    model.load_state_dict(best_model_state)


if __name__ == "__main__":
    # Make sure Ray is initialized
    ray.init()

    # Define a scheduler that supports early stopping on the basis of the reported metric.
    scheduler = ASHAScheduler(
        metric="loss",  # the metric to optimize
        mode="min",  # we want to minimize loss
        max_t=30,  # max training iterations (epochs)
        grace_period=1,  # minimum number of epochs to train
        reduction_factor=2
    )

    # Define the search space
    config = {
        "hidden_size": tune.choice([64, 128, 256]),
        "lr": tune.loguniform(1e-4, 1e-1),
        "dropout_p": tune.uniform(0.0, 0.5),
        "batch_size": tune.choice([32, 64, 128]),
        "patience": tune.choice([3, 5])
    }

    # Run Ray Tune
    analysis = tune.run(
        train_mnist,
        config=config,
        num_samples=10,  # how many random samples of the search space to try
        scheduler=scheduler,
        resources_per_trial={"cpu": 2, "gpu": 0},
        local_dir="./ray_results"  # specify where to store logs and checkpoints
    )

    # Print best config
    print("Best hyperparameters found were: ", analysis.best_config)

    # After tuning is done, load the best model and evaluate on a test set.
    best_trial = analysis.get_best_trial(metric="loss", mode="min", scope="all")
    best_checkpoint_dir = analysis.get_best_checkpoint(best_trial, metric="loss", mode="min")

    # Recreate model with best config
    best_config = best_trial.config
    best_model = SimpleNet(
        input_size=28 * 28,
        hidden_size=best_config["hidden_size"],
        num_classes=10,
        dropout_p=best_config["dropout_p"]
    )

    best_checkpoint_path = os.path.join(best_checkpoint_dir, "checkpoint.pt")
    checkpoint = torch.load(best_checkpoint_path)
    best_model.load_state_dict(checkpoint["best_model_state"])
    best_model.eval()

    # Create the same test loader used during training
    test_transform = transforms.Compose([
        transforms.ToTensor(),
        transforms.Normalize((0.1307,), (0.3081,))
    ])
    test_dataset = datasets.MNIST(root="./data", train=False, download=True, transform=test_transform)
    test_loader = DataLoader(test_dataset, batch_size=1000)

    device = "cuda" if torch.cuda.is_available() else "cpu"
    best_model.to(device)

    correct = 0
    total = 0
    with torch.no_grad():
        for images, labels in test_loader:
            images, labels = images.to(device), labels.to(device)
            outputs = best_model(images)
            _, predicted = torch.max(outputs, 1)
            total += labels.size(0)
            correct += (predicted == labels).sum().item()

    test_accuracy = 100.0 * correct / total
    print(f"Test Accuracy of best trial: {test_accuracy:.2f}%")
