#!/bin/sh
echo on
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd ${DIR}
cp ../gmacs gmacs
cp ../gmacs_25_05.dat gmacs.dat
# cp ../gmacs_25_05.par gmacs.pin
cp ../TannerCrab_AllFisheriesNMFS-CombinedSexCatchDataB.dat TannerCrab.dat
cp ../TannerCrab_25_05.ctl TannerCrab.ctl
cp ../TannerCrab_25_05.prj TannerCrab.prj
echo ./gmacs  -rs -nox -phase 5 -nohess $@
./gmacs  -rs -nox -phase 5 -nohess $@

rm gmacs.bar
rm gmacs.b0*
rm gmacs.p0*
rm gmacs.r0*
rm *.rept
rm variance
rm *.tmp
rm fmin.log