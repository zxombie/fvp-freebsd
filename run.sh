#!/bin/sh

BL1=${BL1:-bl1.bin}
FIP=${FIP:-fip.bin}
MODEL=${MODEL:-Foundation_Platformpkg/models/Linux64_GCC-4.7/Foundation_Platform}

if [ -z "${DISK}" ]
then
	echo "Set DISK to the disk image to use, for example:"
	echo "env DISK=/path/to/image $0"
	exit 1
fi

if [ ! -e "${DISK}" ]
then
	echo "The file '${DISK}' doesn't exist, set DISK to the disk image, for example:"
	echo "env DISK=/path/to/image $0"
	exit 1
fi

if [ ! -e "${BL1}" ]
then
	echo "The file '${BL1}' doesn't exist, set BL1 to bl1.bin, for example:"
	echo "env BL1=/path/to/bl1.bin $0"
	exit 1
fi

if [ ! -e "${FIP}" ]
then
	echo "The file '${FIP}' doesn't exist, set FIP1 to fip.bin, for example:"
	echo "env BL1=/path/to/fip.bin $0"
	exit 1
fi

if [ ! -e "${MODEL}" ]
then
	echo "The file '${MODEL}' doesn't exist, set MODEL to the model executable, for example:"
	echo "env BL1=/path/to/model $0"
	exit 1
fi

${MODEL} \
	--cores=1 --gicv3 \
	--data=${BL1}@0 \
	--data=${FIP}@0x8000000 \
	--block-device=${DISK}
