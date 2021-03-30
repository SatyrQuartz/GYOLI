GYOLI_Hardware_DiskType () {
	echo bios
}

GYOLI_Hardware_CheckSupported () {
	GYOLI_DistroArchSupported=0
	if [ $GYOLI_Arch = "i386" ]; then
	GYOLI_DistroArchSupported=1
	fi
	if [ $GYOLI_Arch = "amd64" ]; then
	GYOLI_DistroArchSupported=1
	fi
	if [ $GYOLI_DistroArchSupported = "1" ]; then
	echo Supported
	fi
	if [ $GYOLI_DistroArchSupported = "0" ]; then
	echo NotSupported
	fi
}