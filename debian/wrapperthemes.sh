#!/bin/sh
ICONDIR=usr/share/icons
WRAPPERDIR=etc/X11/cursors
CURDIR=`pwd`

theme=$1

mkdir -p debian/tmp/${WRAPPERDIR}
cd debian/tmp/${ICONDIR}
grep -v Inherits ${CURDIR}/debian/tmp/${ICONDIR}/${theme}/index.theme > tmp || exit 1
echo "Inherits=${theme}" >> tmp  || exit 1
install -m 644 tmp ${CURDIR}/debian/tmp/${WRAPPERDIR}/${theme}.theme || exit 1
rm tmp || exit 1
exit 0
