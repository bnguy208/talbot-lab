#!/bin/bash -
#SBATCH --job-name=jupyter_server
#SBATCH --output=/home/%u/jupyter_logs/%x_job-%j_%N.log
#SBATCH --mem=300G
#SBATCH --cpus-per-task=16
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --partition=campus-new
#SBATCH --gpus=1
#SBATCH --time=10-00:00:00

# SciWiki Python Virtual Environment Docs: https://sciwiki.fredhutch.org/compdemos/python_virtual_environments/

module purge # Unload all previously loaded modules
ml JupyterLab scanpy Seaborn # Load JupyterLab module
ml R/4.4.2-gfbf-2024a R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2 rpy2/3.5.17-foss-2024a

# Start JupyterLab on the default available port
jupyter lab --ip=$(hostname) --port=$(fhfreeport) --no-browser
