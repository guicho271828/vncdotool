
Steps to reproduce:

* install docker and anaconda/miniconda
* set up a conda environment with `conda env create -f environment.yml`
* enter the conda environment with `conda activate vncdotool-test`
* run `make build`
* run `make run-fork` and confirm that it falls in a deadlock
* run `make run-spawn` and confirm that it runs successfully
