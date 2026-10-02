#!/bin/bash
###############################################################################
# Arcv-test
# 
# Copyright (c) 2026 Michel MEHL. All rights reserved. 
# 
# License terms written down in file LICENSE.txt
# Release file path: pretest.sh
# Release file date: 2026-10-02 05:00
# App version: 1.2.2
# App source revision: 251
# App source signature: 1bb08424eb36952d030fde4b38a351058d8469a796da3cd3861a32f3538a77b3
# Source file last modification: 2026-08-27 19:19:46.159170472 +0200
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


export PATH=/usr/bin/mountpilot/:$PATH

if [ -f "/.dockerenv" ] ; then
    export DOCKER_REPODIR="/tmp/arcv-test-archive"
    #export REPODIR="$HOME/.mnt-arcv-F52G24BPMFZGG5RNORSXG5BNMFZGG2DJOZSQU==="

    # Use the test config 
    av -f "${ARCV_TEST_DIR}/arcv-test-container.yml" &>/dev/null

    export REPODIR="${DOCKER_REPODIR}"
    export REPODIR_ON_HOST="${REPODIR}"
else
    export REPODIR="$HOME/.mnt-arcv-F5UG63LFF5WWSY3IMVWC65DNOAXWC4TDOYWXIZLTOQWWC4TDNBUXMZIK"   # tmp/arcv-test-archive 

    export REPODIR_ON_HOST="/home/michel/tmp/arcv-test-archive"

    # Use the test config 
    #echo "Using arcv test config ${ARCV_TEST_DIR}/arcv-test-host.yml" # ONLY FOR DEBUG, OTHERWISE APPEARS IN THE REPORT
    av -f "${ARCV_TEST_DIR}/arcv-test-host.yml" &>/dev/null

    if ! findmnt --mountpoint "${REPODIR}" &>/dev/null; then    
        av list # This forces resolution of the storage path
    fi
#elif [ -d "${LOCAL_REPODIR}" ] ; then
#    REPODIR="${LOCAL_REPODIR}"
#elif [ ! -d "${REPODIR}" ] ; then
#    echo "ERROR: ${REPODIR} is not valid folder" >&2
#    exit -1
fi


#echo "EXECUTING PRE-TEST SCRIPT. REPODIR='${REPODIR}'"

if [ $(id -u) -eq 0 ]; then
    __SUDO__=""
else
    __SUDO__="sudo "
fi

:<<'EOF'
Term__clear()
{
    :
}
EOF

recreateTestSourceDirWithSpaces()
{
    cleanupTestSourceDirWithSpaces && createTestSourceDirWithSpaces
}

createTestSourceDirWithSpaces()
{
    cd $HOME
    mkdir "test-arcv" &>/dev/null 
    mkdir "test-arcv/test project of mine" &>/dev/null 
    cd "test-arcv/test project of mine" &>/dev/null || _exit -1 "failed to cd to test-project dir"
    echo "Test file A" > "file A.txt" || _exit -1 "failed to create test file A.txt" 
    echo "Test file B" > "file B.txt" || _exit -1 "failed to create test file b.txt" 
    mkdir "system configs" &>/dev/null 
    echo "param1: 100" > "system configs/sys config1.yml" || _exit -1 "failed to create sys config1.yml" 
    echo "param1: 300" > "system configs/sys config3.yml" || _exit -1 "failed to create sys config3.yml" 
}

cleanupTestSourceDirWithSpaces()
{
    local cwd="$PWD"
    cd "$HOME" &>/dev/null

    ${__SUDO__}rm -r "/tmp/test "* 2>/dev/null || true
    [ -d ./test-arcv ] && ${__SUDO__}rm -rf "./test-arcv" || true
    [ -d "${REPODIR}/test project of mine.archive" ] && ${__SUDO__}rm -rf "${REPODIR}/test project of mine.archive" || true

    cd "$cwd" &>/dev/null || true  # the initial folder may not exist anymore
}


cleanupFunProjectDirsWithSpaces()
{
    local cwd="$PWD"
    cd "$HOME" &>/dev/null

    [ -d "/tmp/fun project" ] && ${__SUDO__}rm -rf "/tmp/fun project" || true
    [ -d "./test-arcv/fun project" ] && ${__SUDO__}rm -rf "./test-arcv/fun project" || true
    [ -d "${REPODIR}/fun project.archive" ] && ${__SUDO__}rm -rf "${REPODIR}/fun project.archive" || true

    cd "$cwd" &>/dev/null || true  # the initial folder may not exist anymore
}


recreateTestSourceDir()
{
    cleanupFunProjectDirs && cleanupTestSourceDir && createTestSourceDir
}

createTestSourceDir()
{
    cd "$HOME"
    mkdir "test-arcv" &>/dev/null # || echo "folder 'test-arcv' exists, OK" 
    mkdir "test-arcv/test-project" &>/dev/null #|| echo "folder 'test-arcv/test-project' exists, OK" 
    cd "test-arcv/test-project" &>/dev/null || _exit -1 "failed to cd to test-project dir"
    echo "Test file A" > "file_A.txt" || _exit -1 "failed to create test file A" 
    echo "Test file B" > "file_B.txt" || _exit -1 "failed to create test file B" 
}

cleanupTestSourceDir()
{    
    local cwd="$PWD"
    cd "$HOME" &>/dev/null

    ${__SUDO__}rm -r /tmp/test-* 2>/dev/null || true
    [ -d ./test-arcv ] && ${__SUDO__}rm -rf "./test-arcv" || true
    [ -d "${REPODIR}/test-project.archive" ] && ${__SUDO__}rm -rf "${REPODIR}/test-project.archive" || true

    cd "$cwd" &>/dev/null || true  # the initial folder may not exist anymore
}

cleanupFunProjectDirs()
{
    local cwd="$PWD"
    cd "$HOME" &>/dev/null

    [ -d /tmp/fun-project ] && ${__SUDO__}rm -rf "/tmp/fun-project" || true
    [ -d ./test-arcv/fun-project ] && ${__SUDO__}rm -rf "./test-arcv/fun-project" || true
    [ -d "${REPODIR}/fun-project.archive" ] && ${__SUDO__}rm -rf "${REPODIR}/fun-project.archive" || true

    cd "$cwd" &>/dev/null || true  # the initial folder may not exist anymore
}

if [ $# -gt 0 ] ; then
    case "$1" in
        recreate)
            recreateTestSourceDir
        ;;
        create)
            createTestSourceDir
        ;;
        clean)
            cleanupTestSourceDir
        ;;

        *) ;;
    esac
fi
