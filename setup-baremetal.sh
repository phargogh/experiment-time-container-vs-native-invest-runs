#!/usr/bin/env bash

module load python/3.9.0
module load physics gdal py-gdal-utils

python3 -m venv invest-env --system-site-packages
source invest-env/bin/activate

which python
which pip

pip install natcap.invest


