# fdisk part by user2070305 from superuser.com

GYOLI_Disk_Setup () {
	sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk $GYOLI_DiskDevice
  o # clear the in memory partition table
  n # new partition
  p # primary partition
  1 # Make Partition
    # default - start at beginning of disk 
  +100M # 100 MB boot parttion
  n # new partition
  p # primary partition
  2 # partion number 2
    # default, start immediately after preceding partition
    # default, extend partition to end of disk
  a # make a partition bootable
  1 # bootable partition is partition 1
  p # print the in-memory partition table
  w # write the partition table
  q # and we're done
EOF
  GYOLI_Disk_BootPart=$GYOLI_Partition1
  GYOLI_Disk_RootPart=$GYOLI_Partition2
  if [ ! -e $GYOLI_Disk_BootPart ]; then
    echo "GYOLI | error | Disk: $GYOLI_Disk_BootPart not Found"
    exit
  fi
	mkfs.ext4 $GYOLI_Disk_BootPart
  if [ ! -e "$GYOLI_Disk_RootPart" ]; then
    echo "GYOLI | error | Disk: $GYOLI_Disk_RootPart not Found"
    exit
  fi
	mkfs.ext4 $GYOLI_Disk_RootPart
}

GYOLI_Disk_Mount () {
	mkdir $GYOLI_RootFS 
	mount $GYOLI_Disk_RootPart $GYOLI_RootFS 
	mkdir $GYOLI_RootFS/boot/
	mount $GYOLI_Disk_BootPart $GYOLI_RootFS/boot/
}

GYOLI_Disk_Unmount () {
	umount $GYOLI_RootFS/dev/
	umount $GYOLI_RootFS/proc/
	umount $GYOLI_RootFS/sys/
	umount $GYOLI_RootFS/boot/
	umount $GYOLI_RootFS 
}
