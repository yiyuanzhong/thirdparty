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
# Tools, won't replace/yet replaced.
# Toolchain, won't replace.
# Toolchain (continued), won't replace.
# Toolchain (continued), won't replace.
for i in \
    cat chmod cp echo expr ln ls mkdir mv rm sort touch rmdir \
    uname uniq tr basename date install printf md5sum false \
    cmp diff gzip tar sed grep make \
    SetFile awk curl md5 openssl perl sh ps \
    addr2line ar as c++filt gprof ld nm nmedit objcopy objdump \
    ranlib readelf size strings strip c++ cc g++ gcc gcov ldd \
    otool install_name_tool; do

    run "${i}"
done

exit 0
