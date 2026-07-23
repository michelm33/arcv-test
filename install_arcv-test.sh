#!/bin/bash
###############################################################################
#
# Arcv tester - test suite install script
#
# Copyright (c) 2024-2026 Michel Mehl. All rights reserved.
#
# ------------------------------------------------------------------------------
#
#
# ------------------------------------------------------------------------------
#
# Report bugs to michel.mehl@slashetc.fr
#
###############################################################################

shotplan_version=1.0-0
shellapi_version=1.1-0
arcv_version=1.0-0
baseurl="https://slashetc.fr/download"
arcv_pkg="arcv_${arcv_version}_amd64.deb"
arcvtest_pkg="arcv-test_${arcv_version}_amd64.deb"
shellapi_pkg="shell-api_${shellapi_version}_amd64.deb"
shotplan_pkg="shotplan_${shotplan_version}_amd64.deb"

if  ! dpkg-query -l wget &>/dev/null || [ $(dpkg-query -W -f='${db:Status-Abbrev}' wget) != "ii" ]  ; then
    apt-get install -y wget
fi

wget "${baseurl}/${shellapi_pkg}" && dpkg -i "${shellapi_pkg}" && rm "${shellapi_pkg}" || echo "Installation of shell-api failed"

wget "${baseurl}/${arcv_pkg}" && dpkg -i "${arcv_pkg}" && rm "${arcv_pkg}" || echo "Installation of arcv failed"

wget "${baseurl}/${shotplan_pkg}" && dpkg -i "${shotplan_pkg}" && rm "${shotplan_pkg}" || echo "Installation of shotplan failed"

wget "${baseurl}/${arcvtest_pkg}" && dpkg -i "${arcvtest_pkg}" && rm "${arcvtest_pkg}" || echo "Installation of arcv failed"
