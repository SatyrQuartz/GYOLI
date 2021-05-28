#!/usr/bin/env bash

# ------- Setup -------

if [ -z $GYOLI_Hardware ]; then
  echo "GYOLI | info | Script: GYOLI_Hardware is not set. using bios"
  GYOLI_Hardware=bios
fi

if [ -z $GYOLI_Distro ]; then
  echo "GYOLI | info | Script: GYOLI_Distro is not set. using debian-10"
  GYOLI_Distro=debian-10
fi

if [ -z $GYOLI_Arch ]; then
  echo "GYOLI | info | Script: GYOLI_Arch is not set. using amd64"
  GYOLI_Arch=amd64
fi

if [ -z $GYOLI_DiskDevice ]; then
  echo "GYOLI | error | Script: GYOLI_DiskDevice is not set"
  exit
fi

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

# ------- Partition Setup -------
if [[ $GYOLI_DiskDevice == "/dev/sd"* ]]; then
	GYOLI_Partition1="${GYOLI_DiskDevice}1"
	GYOLI_Partition2="${GYOLI_DiskDevice}2"
	GYOLI_Partition3="${GYOLI_DiskDevice}3"
	GYOLI_Partition4="${GYOLI_DiskDevice}4"
	GYOLI_Partition5="${GYOLI_DiskDevice}5"
	GYOLI_Partition6="${GYOLI_DiskDevice}6"
	GYOLI_Partition7="${GYOLI_DiskDevice}7"
	GYOLI_Partition8="${GYOLI_DiskDevice}8"
	GYOLI_Partition9="${GYOLI_DiskDevice}9"
	GYOLI_Partition10="${GYOLI_DiskDevice}10"
	GYOLI_Partition11="${GYOLI_DiskDevice}11"
	GYOLI_Partition12="${GYOLI_DiskDevice}12"
	GYOLI_Partition13="${GYOLI_DiskDevice}13"
	GYOLI_Partition14="${GYOLI_DiskDevice}14"
	GYOLI_Partition15="${GYOLI_DiskDevice}15"
	GYOLI_Partition16="${GYOLI_DiskDevice}16"
fi

if [[ $GYOLI_DiskDevice == "/dev/nbd"* ]]; then
	GYOLI_Partition1="${GYOLI_DiskDevice}p1"
	GYOLI_Partition2="${GYOLI_DiskDevice}p2"
	GYOLI_Partition3="${GYOLI_DiskDevice}p3"
	GYOLI_Partition4="${GYOLI_DiskDevice}p4"
	GYOLI_Partition5="${GYOLI_DiskDevice}p5"
	GYOLI_Partition6="${GYOLI_DiskDevice}p6"
	GYOLI_Partition7="${GYOLI_DiskDevice}p7"
	GYOLI_Partition8="${GYOLI_DiskDevice}p8"
	GYOLI_Partition9="${GYOLI_DiskDevice}p9"
	GYOLI_Partition10="${GYOLI_DiskDevice}p10"
	GYOLI_Partition11="${GYOLI_DiskDevice}p11"
	GYOLI_Partition12="${GYOLI_DiskDevice}p12"
	GYOLI_Partition13="${GYOLI_DiskDevice}p13"
	GYOLI_Partition14="${GYOLI_DiskDevice}p14"
	GYOLI_Partition15="${GYOLI_DiskDevice}p15"
	GYOLI_Partition16="${GYOLI_DiskDevice}p16"
fi

if [[ $GYOLI_DiskDevice == "/dev/disk/"* ]]; then
	GYOLI_Partition1="${GYOLI_DiskDevice}-part1"
	GYOLI_Partition2="${GYOLI_DiskDevice}-part2"
	GYOLI_Partition3="${GYOLI_DiskDevice}-part3"
	GYOLI_Partition4="${GYOLI_DiskDevice}-part4"
	GYOLI_Partition5="${GYOLI_DiskDevice}-part5"
	GYOLI_Partition6="${GYOLI_DiskDevice}-part6"
	GYOLI_Partition7="${GYOLI_DiskDevice}-part7"
	GYOLI_Partition8="${GYOLI_DiskDevice}-part8"
	GYOLI_Partition9="${GYOLI_DiskDevice}-part9"
	GYOLI_Partition10="${GYOLI_DiskDevice}-part10"
	GYOLI_Partition11="${GYOLI_DiskDevice}-part11"
	GYOLI_Partition12="${GYOLI_DiskDevice}-part12"
	GYOLI_Partition13="${GYOLI_DiskDevice}-part13"
	GYOLI_Partition14="${GYOLI_DiskDevice}-part14"
	GYOLI_Partition15="${GYOLI_DiskDevice}-part15"
	GYOLI_Partition16="${GYOLI_DiskDevice}-part16"
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
