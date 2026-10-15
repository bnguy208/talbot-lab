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

# Version 1:
module purge # Unload all previously loaded modules
ml JupyterLab scanpy Seaborn # Load JupyterLab module
ml R/4.4.2-gfbf-2024a R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2 rpy2/3.5.17-foss-2024a

# Start JupyterLab on the default available port
jupyter lab --ip=$(hostname) --port=$(fhfreeport) --no-browser

# ---
# Tips for Modules
# module avail # List all available modules
# module list # List all loaded modules
# module load <module_name> # Load a specific module
# module purge # Unload all modules
# ---

# Version 2 (to run rpy2):
# mkdir -p $HOME/.fakehome
# ml purge
# ml Apptainer
# export PORT=$(fhfreeport)
# apptainer run \
#     --bind $HOME:$HOME/.fakehome \
#     --bind /fh:/fh \
#     --bind /hpc:/hpc \
#     https://sif-registry.fredhutch.org/fredhutch_single-cell-best-practices_r442.sif \
#     jupyter lab --port $PORT --ip 0.0.0.0

