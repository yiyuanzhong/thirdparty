#! /bin/sh

if [ $# -ne 2 ]; then
    echo "${0} <loader path> <libdir>"
    exit 2
elif [ ! -f "${1}" ] || [ ! -d "${2}" ]; then
    echo "Invalid arguments."
    exit 2
fi

LIBDIR=`cd "${2}" && pwd` || exit 2
BINDIR=`dirname "${1}"` || exit 2
BINDIR=`cd "${BINDIR}" && pwd` || exit 2
BINFILE=`basename "${1}"` || exit 2
BINNAME="${BINDIR}/${BINFILE}"

SYSTEM=`uname -s` || exit 1
CWD=`dirname "${0}"` || exit 1
CWD=`cd "${CWD}" && pwd` || exit 1
export PATH="${CWD}/tools/bin"

linux()
{
    elf=`readelf -d "${BINNAME}" 2>/dev/null`
    if [ $? -ne 0 ]; then # Nothing I can do.
        echo "[IGNORE] ${BINNAME} is not ELF."
        return 0
    fi

    chmod +wx "${BINNAME}" || return 1
    rpath=`echo "${elf}" | awk '{ if ($2 == "(RPATH)") { print substr($5, 2, length($5) - 2); exit(0); } }'`
    runpath=`echo "${elf}" | awk '{ if ($2 == "(RUNPATH)") { print substr($5, 2, length($5) - 2); exit(0); } }'`

    if [ -z "${runpath}" ] && [ -z "${rpath}" ]; then
        echo "[IGNORE] ${BINNAME} has neither DT_RUNPATH nor DT_RPATH."
        return 0
    fi

    lib=`ldd "${BINNAME}"` || return 1
    newpath=`echo "${lib}" | awk "{
        if (\\$3 == \\"\\" || substr(\\$3, 1, 1) != \\"/\\") next
        cmd=\"readlink -e \"\\$3
        cmd | getline bin
        close(cmd)
        split(bin, a, \\"/\\")
        split(\\"${BINDIR}\\", b, \\"/\\")
        split(\\"${LIBDIR}\\", e, \\"/\\")
        if (length(a) != length(e) + 1) next
        for (i = 2; i <= length(a); ++i) {
            if (a[i] != e[i]) {
                break
            }
        }

        if (i != length(a)) next
        size = length(b) < length(e) ? length(b) : length(e)
        for (i = 1; i < size; ++i) {
            if (b[i + 1] != e[i + 1]) {
                break
            }
        }

        remdir = i
        updir = length(b) - remdir
        ret = \\"\\$ORIGIN\\"
        for (i = 0; i < updir; ++i) {
            ret = ret \\"/..\\"
        }

        for (i = remdir + 1; i <= length(e); ++i) {
            if (e[i] == \\"\\") break
            ret = ret \\"/\\" e[i]
        }

        print ret
        exit 170
    }"`

    ret=$?
    if [ ${ret} -eq 0 ]; then
        echo "[REMOVE] ${BINNAME} has no dependencies in ${LIBDIR}."
        chrpath -d "${BINNAME}"
        return $?
    elif [ ${ret} -ne 170 ]; then
        return 1
    fi

    echo "[CHANGE] ${BINNAME} set to [${newpath}]."
    if [ -n "${runpath}" ]; then
        chrpath -r "${newpath}" "${BINNAME}" || return 1
    else
        chrpath -c -r "${newpath}" "${BINNAME}" || return 1
    fi

    return 0
}

macosx()
{
    d=`otool -D "${BINNAME}" 2>/dev/null`
    if [ $? -ne 0 ]; then
        echo "[IGNORE] ${BINNAME} type unknown."
        return 0
    fi

    if [ x`echo "${d}" | awk '{ print $NF; exit }'` != x"${BINNAME}:" ]; then
        echo "[IGNORE] ${BINNAME} is not Mach-O."
        return 0
    fi

    o=`echo "${d}" | tail -n +2`
    if [ $? -ne 0 ]; then
        return 1
    fi

    l=`otool -L "${BINNAME}" 2>/dev/null`
    if [ $? -ne 0 ]; then
        return 1
    fi

    chmod +wx "${BINNAME}" || return 1
    if [ -n "${o}" ]; then
        install_name_tool -id "${BINNAME}" "${BINNAME}"
        if [ $? -ne 0 ]; then
            return 1
        fi
        o=`echo "${l}" | tail -n +3`
        if [ $? -ne 0 ]; then
            return 1
        fi
    else
        o=`echo "${l}" | tail -n +2`
        if [ $? -ne 0 ]; then
            return 1
        fi
    fi

    if [ -z "${o}" ]; then
        return 0
    fi

    echo "${o}" | awk "{
        if (substr(\$1, 1, 1) != \"/\") {
            print \"[CHANGE] ${BINNAME}: \" \$1 \" to ${LIBDIR}/\" \$1
            if (system(\"install_name_tool -change \" \$1 \" ${LIBDIR}/\" \$1 \" ${BINNAME}\")) exit 1
        }
    }"

    return $?
}

case "${SYSTEM}" in
    Linux)
        linux
        ;;
    Darwin)
        macosx
        ;;
    *)
        echo "Unsupported machine: ${SYSTEM}"
        false
        ;;
esac
exit $?
