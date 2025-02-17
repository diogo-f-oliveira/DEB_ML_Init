import os
import pickle
import torch


def save_sklearn_model(model, folder, filename):
    with open(os.path.join(folder, filename), 'wb') as f:
        pickle.dump(model, f)


def save_pytorch_model(model, folder, filename):
    save_path = os.path.join(folder, filename + '.pth')
    torch.save(model, save_path)
