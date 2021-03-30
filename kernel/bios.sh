GYOLI_Kernel_Install () {
	if [ $GYOLI_Distro = "debian-10" ]; then
		if [ $GYOLI_Arch = "i386" ]; then
		chroot $GYOLI_RootFS /usr/bin/apt install -y linux-image-686
		fi
		if [ $GYOLI_Arch = "amd64" ]; then
		chroot $GYOLI_RootFS /usr/bin/apt install -y linux-image-amd64
		fi
	fi
}
