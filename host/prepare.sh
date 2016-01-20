#! /bin/sh

CWD=`dirname "${0}"` || exit 1
CWD=`cd "${CWD}" && pwd` || exit 1
mkdir -p "${CWD}/../tools/bin" || exit 1
cd "${CWD}/../tools/bin" || exit 1

run()
{
    if [ ! -f "${1}" ]; then
        real=`which "${1}"` || return 0
        ln -s "${real}" || exit 1
    fi
    return 0
}

# Coreutils, will replace.
# Coreutils (continued), will replace.
# Tools, will replace.
# Tools, won't/yet replaced.
# Toolchain, won't replace.
# Toolchain (continued), won't replace.
for i in \
    cat chmod cp expr ln ls mkdir mv rm sort touch rmdir \
    uname uniq tr basename date install printf \
    cmp diff gzip tar sed grep make patch \
    SetFile awk perl sh ps \
    addr2line ar as c++filt gprof ld nm nmedit objcopy objdump \
    ranlib readelf size strings strip c++ cc g++ gcc gcov ldd; do

    run "${i}"
done

exit 0
