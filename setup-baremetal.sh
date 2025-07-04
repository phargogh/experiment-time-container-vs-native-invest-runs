#!/usr/bin/env bash

module load python/3.9.0
module load physics gdal/3.10.2

python3 -m venv invest-env --system-site-packages
source invest-env/bin/activate

# Verify we're within the activated environment and use the activated python/pip.
which python
python -m pip install --upgrade pip

# The gdal version MUST be compatible with the libgdal version loaded above
# It's easiest if we just use the same version exactly.
python -m pip install natcap.invest gdal==3.10.2


