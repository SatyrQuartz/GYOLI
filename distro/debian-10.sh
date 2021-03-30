GYOLI_Distro_GetRealName () {
   echo "Debian Buster"
}

GYOLI_Distro_CheckSupported () {
	GYOLI_DistroArchSupported=0
	if [ $GYOLI_Arch = "armel" ]; then
	GYOLI_DistroArchSupported=1
	fi
	if [ $GYOLI_Arch = "armhf" ]; then
	GYOLI_DistroArchSupported=1
	fi
	if [ $GYOLI_Arch = "arm64" ]; then
	GYOLI_DistroArchSupported=1
	fi
	if [ $GYOLI_Arch = "i386" ]; then
	GYOLI_DistroArchSupported=1
	fi
	if [ $GYOLI_Arch = "amd64" ]; then
	GYOLI_DistroArchSupported=1
	fi
	if [ $GYOLI_Arch = "mips" ]; then
	GYOLI_DistroArchSupported=1
	fi
	if [ $GYOLI_Arch = "mipsel" ]; then
	GYOLI_DistroArchSupported=1
	fi
	if [ $GYOLI_Arch = "mips64el" ]; then
	GYOLI_DistroArchSupported=1
	fi
	if [ $GYOLI_Arch = "ppc64el" ]; then
	GYOLI_DistroArchSupported=1
	fi
	if [ $GYOLI_Arch = "riscv64" ]; then
	GYOLI_DistroArchSupported=1
	fi
	if [ $GYOLI_Arch = "s390x" ]; then
	GYOLI_DistroArchSupported=1
	fi
	if [ $GYOLI_DistroArchSupported = "1" ]; then
	echo Supported
	fi
	if [ $GYOLI_DistroArchSupported = "0" ]; then
	echo NotSupported
	fi
}

GYOLI_Distro_SetupRootFS () {
	if [ $GYOLI_Arch = "armel" ]; then
	/usr/sbin/debootstrap --arch armel buster $GYOLI_RootFS http://ftp.us.debian.org/debian
	fi
	if [ $GYOLI_Arch = "armhf" ]; then
	/usr/sbin/debootstrap --arch armhf buster $GYOLI_RootFS http://ftp.us.debian.org/debian
	fi
	if [ $GYOLI_Arch = "arm64" ]; then
	/usr/sbin/debootstrap --arch arm64 buster $GYOLI_RootFS http://ftp.us.debian.org/debian
	fi
	if [ $GYOLI_Arch = "i386" ]; then
	/usr/sbin/debootstrap --arch i386 buster $GYOLI_RootFS http://ftp.us.debian.org/debian
	fi
	if [ $GYOLI_Arch = "amd64" ]; then
	/usr/sbin/debootstrap --arch amd64 buster $GYOLI_RootFS http://ftp.us.debian.org/debian
	fi
	if [ $GYOLI_Arch = "mips" ]; then
	/usr/sbin/debootstrap --arch mips buster $GYOLI_RootFS http://ftp.us.debian.org/debian
	fi
	if [ $GYOLI_Arch = "mipsel" ]; then
	/usr/sbin/debootstrap --arch mipsel buster $GYOLI_RootFS http://ftp.us.debian.org/debian
	fi
	if [ $GYOLI_Arch = "mips64el" ]; then
	/usr/sbin/debootstrap --arch mips64el buster $GYOLI_RootFS http://ftp.us.debian.org/debian
	fi
	if [ $GYOLI_Arch = "ppc64el" ]; then
	/usr/sbin/debootstrap --arch ppc64el buster $GYOLI_RootFS http://ftp.us.debian.org/debian
	fi
	if [ $GYOLI_Arch = "riscv64" ]; then
	/usr/sbin/debootstrap --arch riscv64 buster $GYOLI_RootFS http://ftp.us.debian.org/debian
	fi
	if [ $GYOLI_Arch = "s390x" ]; then
	/usr/sbin/debootstrap --arch s390x buster $GYOLI_RootFS http://ftp.us.debian.org/debian
	fi
	echo "debian" > $GYOLI_RootFS/etc/hostname
	chroot $GYOLI_RootFS /usr/bin/bash -c 'echo "root:password" | chpasswd'
	chroot $GYOLI_RootFS /usr/bin/apt update
	mount --bind /dev $GYOLI_RootFS/dev/
	mount --bind /proc $GYOLI_RootFS/proc/
	mount --bind /sys $GYOLI_RootFS/sys/
}