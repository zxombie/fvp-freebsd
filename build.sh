#!/bin/sh

ROOT=`dirname $0`

CPPARGS="-P -x assembler-with-cpp"
CPPARGS="${CPPARGS} -I ${ROOT}/dts"
#CPPARGS="${CPPARGS} -include ${ROOT}/dts/foundation-v8-gicv3.dts /dev/null"
CPPARGS="${CPPARGS} -include ${ROOT}/dts/foundation-v8-gicv2.dts /dev/null"

cpp ${CPPARGS} | dtc -O dtb -o fvp-foundation-gicv3-psci.dtb -

