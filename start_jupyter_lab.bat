@echo off
:: Set the Conda environment name
set ENV_NAME=ml_bijection

:: Activate the Conda environment
call conda activate %ENV_NAME%

:: Navigate to the folder of the script
cd /d "%~dp0"

:: Start Jupyter Lab
jupyter-lab
