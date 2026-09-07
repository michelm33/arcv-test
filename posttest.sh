#!/bin/bash
###############################################################################
# Arcv-test
# 
# Copyright (c) 2026 Michel MEHL. All rights reserved. 
# 
# License terms written down in file LICENSE.txt
# Release file path: posttest.sh
# Release file date: 2026-09-06 23:46
# App version: 1.2.1
# App source revision: 239
# App source signature: 73f3ec4cf9055d6eb78ae7ed07fc259d1c9cecf2ff1bdf70ecf5f69b51b4ee1f
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
