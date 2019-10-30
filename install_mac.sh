conda install conda
conda clean --all
conda config --set auto_activate_base false
conda env create -f environment_mac.yml
git submodule init
git submodule update
