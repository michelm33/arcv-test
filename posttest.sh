#!/bin/bash
###############################################################################
#
# Arcv posttest script executed by shotplan
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