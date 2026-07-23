#!/bin/bash
###############################################################################
#
# Arcv pretest script executed by shotplan
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


export REPODIR="$HOME/.mnt-arcv-F5UG63LFF5WWSY3IMVWC65DNOAXWC4TDOYWXIZLTOQWWC4TDNBUXMZIK"   # tmp/arcv-test-archive 
export DOCKER_REPODIR="$HOME/Archive"


export PATH=/usr/bin/mountpilot/:$PATH

if [ -d "${DOCKER_REPODIR}" ] ; then
    # Use the test config 
    av -f "${ARCV_TEST_DIR}/arcv-test-container.yml" &>/dev/null

    REPODIR="${DOCKER_REPODIR}"
else
    # Use the test config 
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
    pushd "$HOME" &>/dev/null
    ${__SUDO__}rm -r "/tmp/test "* 2>/dev/null || true
    [ -d ./test-arcv ] && ${__SUDO__}rm -rf "./test-arcv" || true
    [ -d "${REPODIR}/test project of mine.archive" ] && ${__SUDO__}rm -rf "${REPODIR}/test project of mine.archive" || true
    popd &>/dev/null
}


cleanupFunProjectDirsWithSpaces()
{
    pushd "$HOME" &>/dev/null
    [ -d "/tmp/fun project" ] && ${__SUDO__}rm -rf "/tmp/fun project" || true
    [ -d "./test-arcv/fun project" ] && ${__SUDO__}rm -rf "./test-arcv/fun project" || true
    [ -d "${REPODIR}/fun project.archive" ] && ${__SUDO__}rm -rf "${REPODIR}/fun project.archive" || true
    popd &>/dev/null
}


recreateTestSourceDir()
{
    cleanupFunProjectDirs && cleanupTestSourceDir && createTestSourceDir
}

createTestSourceDir()
{
    cd $HOME
    mkdir "test-arcv" &>/dev/null # || echo "folder 'test-arcv' exists, OK" 
    mkdir "test-arcv/test-project" &>/dev/null #|| echo "folder 'test-arcv/test-project' exists, OK" 
    cd "test-arcv/test-project" &>/dev/null || _exit -1 "failed to cd to test-project dir"
    echo "Test file A" > "file_A.txt" || _exit -1 "failed to create test file A" 
    echo "Test file B" > "file_B.txt" || _exit -1 "failed to create test file B" 
}

cleanupTestSourceDir()
{
    pushd "$HOME" &>/dev/null
    ${__SUDO__}rm -r /tmp/test-* 2>/dev/null || true
    [ -d ./test-arcv ] && ${__SUDO__}rm -rf "./test-arcv" || true
    [ -d "${REPODIR}/test-project.archive" ] && ${__SUDO__}rm -rf "${REPODIR}/test-project.archive" || true
    popd &>/dev/null
}

cleanupFunProjectDirs()
{
    pushd "$HOME" &>/dev/null
    [ -d /tmp/fun-project ] && ${__SUDO__}rm -rf "/tmp/fun-project" || true
    [ -d ./test-arcv/fun-project ] && ${__SUDO__}rm -rf "./test-arcv/fun-project" || true
    [ -d "${REPODIR}/fun-project.archive" ] && ${__SUDO__}rm -rf "${REPODIR}/fun-project.archive" || true
    popd &>/dev/null
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