#!/bin/bash
###############################################################################
# Arcv-test
# 
# Copyright (c) 2026 Michel MEHL. All rights reserved. 
# 
# License terms written down in file LICENSE.txt
# Release file path: posttest.sh
# Release file date: 2026-07-23 15:46
# App version: 1.0.0
# App source revision: 145
# App source signature: 116201585e582dd90c97262a28219baec90914d196015114cd40a8fac9612ba5
# Source file last modification: 2026-07-18 18:47:20.598307586 +0200
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

export DOCKER_REPODIR="$HOME/Archive"

echo "EXECUTING POST-TEST SCRIPT. REPODIR='${REPODIR}'"

# This code block is not relevant when run inside a container
if [ ! -d "${DOCKER_REPODIR}" ] ; then
    # Restore initial config, replace with your own environment
    av -f "$HOME/riffian/Data/Data/admin/linux/configs/arcv.yml"

    if findmnt --mountpoint "${REPODIR}" &>/dev/null; then
        echo "UNMOUNTING'${REPODIR}'"
        sudo umount "${REPODIR}"
    else
        echo "NOT MOUNTED : '${REPODIR}'"
    fi
fi
