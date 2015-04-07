#! /bin/sh

if [ $# -ne 2 ]; then
    echo "${0} <program name> <version>"
    exit 2
fi

eval `echo "${2}" | awk -F. '{ print "major="$1" minor="$2" fix="$3}'`
v=`"${1}" -dumpversion` || exit 2
echo "${v}" | awk -F. "{
    if (\$1 > ${major} ||
        \$1 == ${major} && \$2 > ${minor} ||
        \$1 == ${major} && \$2 == ${minor} && \$3 >= ${fix}) exit 0;
    else exit 1; }"

if [ $? -eq 0 ]; then
    echo 'OK'
    exit 0
else
    echo 'NO'
    exit 1
fi
