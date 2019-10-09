#!/bin/bash

set -e
set -x

# Deactivate license when it exists
deactivate() {
    echo "Deactivating license ..."
    /opt/rstudio-pm/bin/license-manager deactivate >/dev/null 2>&1
}
trap deactivate EXIT

# Activate License
if ! [ -z "$RSPM_LICENSE" ]; then
    /opt/rstudio-pm/bin/license-manager activate $RSPM_LICENSE
elif test -f "/etc/rstudio-pm/license.lic"; then
    /opt/rstudio-pm/bin/license-manager activate-file /etc/rstudio-pm/license.lic
fi

# Start RStudio Package Manager
/usr/lib/rstudio-pm/bin/
