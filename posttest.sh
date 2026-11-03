#!/bin/bash
###############################################################################
# Arcv-test
# 
# Copyright (c) 2026 Michel MEHL. All rights reserved. 
# 
# License terms written down in file LICENSE.txt
# Release file path: posttest.sh
# Release file date: 2026-10-25 20:13
# App version: 2.0.0
# App source revision: 270
# App source signature: d027990262239a4dfb376e7f2438af668e9c5274dc47c401dbbe26dbbe7a2c2a
# Source file last modification: 2026-08-27 14:00:56.004285524 +0200
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

export DOCKER_REPODIR="/tmp/arcv-test-archive"

echo "EXECUTING POST-TEST SCRIPT. REPODIR='${REPODIR}'"

# This code block is not relevant when run inside a container
if [ ! -f "/.dockerenv" ] ; then
    # Restore initial config, replace with your own environment
    av -f "$HOME/riffian/Data/Data/admin/linux/configs/arcv.yml"

    if findmnt --mountpoint "${REPODIR}" &>/dev/null; then
        echo "UNMOUNTING'${REPODIR}'"
        sudo umount "${REPODIR}"
    else
        echo "NOT MOUNTED : '${REPODIR}'"
    fi
fi
