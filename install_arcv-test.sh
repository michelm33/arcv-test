#!/bin/bash
###############################################################################
# Arcv-test
# 
# Copyright (c) 2026 Michel MEHL. All rights reserved. 
# 
# License terms written down in file LICENSE.txt
# Release file path: install_arcv-test.sh
# Release file date: 2026-07-23 15:46
# App version: 1.0.0
# App source revision: 145
# App source signature: 116201585e582dd90c97262a28219baec90914d196015114cd40a8fac9612ba5
# Source file last modification: 2026-07-22 16:46:59.084744163 +0200
#
# This header was generated. Do not modify.
#
# ------------------------------------------------------------------------------
#
#
# ------------------------------------------------------------------------------
# 
# Report bugs and suggestions: 
#     assistance@slashetc.fr
# 
# Specific or corporate requirements or extensions: 
#     info@slashetc.fr
# 
# The author is overall not required to provide maintenance or support 
# outside specific commercial terms agreed.
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
