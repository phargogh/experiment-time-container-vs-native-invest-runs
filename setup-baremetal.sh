#!/usr/bin/env bash

module load python/3.9.0
module load physics gdal py-gdal-utils

python3 -m venv invest-env --system-site-packages
source invest-env/bin/activate

# Verify we're within the activated environment and use the activated python/pip.
which python
python -m pip install --upgrade pip
python -m pip install natcap.invest


