#!/usr/bin/env bash

# ------- Setup -------

GYOLI_Distro=$1
GYOLI_Arch=$2 
GYOLI_Hardware=$3
GYOLI_DiskDevice=$4
GYOLI_Distro_Script=./distro/$GYOLI_Distro.sh
GYOLI_Hardware_Script=./hardware/$GYOLI_Hardware.sh
GYOLI_Boot_Script=./boot/$GYOLI_Hardware.sh
GYOLI_Kernel_Script=./kernel/$GYOLI_Hardware.sh

if [ ! -f $GYOLI_Distro_Script ]; then
    echo "GYOLI | error | Distro $GYOLI_Distro_Script Not Found"
    exit
fi
source $GYOLI_Distro_Script
GYOLI_Distro_Realname=$(GYOLI_Distro_GetRealName)

if [ ! -f $GYOLI_Hardware_Script ]; then
    echo "GYOLI | error | Script: Hardware Script $GYOLI_Hardware_Script Not Found"
    exit
fi
source $GYOLI_Hardware_Script
GYOLI_DiskType=$(GYOLI_Hardware_DiskType)

if [ ! -f $GYOLI_Disk_Script ]; then
    echo "GYOLI | error | Script: Disk Script $GYOLI_Disk_Script Not Found"
    exit
fi
GYOLI_Disk_Script=./disk/$GYOLI_DiskType.sh
source $GYOLI_Disk_Script

if [ ! -f $GYOLI_Boot_Script ]; then
    echo "GYOLI | error | Script: Bootloader Script $GYOLI_Boot_Script Not Found"
    exit
fi
source $GYOLI_Boot_Script

if [ ! -f $GYOLI_Kernel_Script ]; then
    echo "GYOLI | error | Script: Kernel Script $GYOLI_Kernel_Script Not Found"
    exit
fi
source $GYOLI_Kernel_Script

echo "GYOLI | info | Set: Disk Device: $GYOLI_DiskDevice"
echo "GYOLI | info | Set: Hardware: $GYOLI_Hardware"
echo "GYOLI | info | Set: Disk Type: $GYOLI_DiskType"
echo "GYOLI | info | Set: Arch: $GYOLI_Arch"
echo "GYOLI | info | Set: Distro: $GYOLI_Distro ($GYOLI_Distro_Realname)"
echo "GYOLI | info | Script: Hardware: $GYOLI_Hardware_Script"
echo "GYOLI | info | Script: Disk: $GYOLI_Disk_Script"
echo "GYOLI | info | Script: Distro: $GYOLI_Distro_Script"
echo "GYOLI | info | Script: Kernel: $GYOLI_Kernel_Script"
echo "GYOLI | info | Script: Bootloader: $GYOLI_Boot_Script"

# ------- Check -------

echo "GYOLI | info | CompatCheck: Distro-Arch"
GYOLI_Compat_DistroArch=$(GYOLI_Distro_CheckSupported)
	if [ $GYOLI_Compat_DistroArch = "NotSupported" ]; then
	echo "GYOLI | error | CompatCheck: Distro-Arch Combo Not Supported"
	exit
	fi
echo "GYOLI | info | CompatCheck: Machine-Arch"
GYOLI_Compat_MachineArch=$(GYOLI_Hardware_CheckSupported)
	if [ $GYOLI_Compat_MachineArch = "NotSupported" ]; then
	echo "GYOLI | error | CompatCheck: Machine-Arch Combo Not Supported"
	exit
	fi

# ------- Generate -------

GYOLI_RootFS=./mount_root
echo "GYOLI | make | Generate: DiskType+Hardware: Partition Disk"
GYOLI_Disk_Setup
echo "GYOLI | make | Generate: DiskDevice: Mount Disk"
GYOLI_Disk_Mount
echo "GYOLI | make | Generate: Distro+Arch: Setup Rootfs"
GYOLI_Distro_SetupRootFS 
echo "GYOLI | make | Generate: Boot: Install Kernel"
GYOLI_Kernel_Install
echo "GYOLI | make | Generate: Boot: install Bootloader"
GYOLI_Bootloader_Install
echo "GYOLI | make | Generate: DiskDevice: Unmount Disk"
GYOLI_Disk_Unmount
