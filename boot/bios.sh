GYOLI_Bootloader_Install () {
	if [ $GYOLI_Distro = "debian-10" ]; then
		if [ $GYOLI_Arch = "i386" ]; then
		chroot $GYOLI_RootFS /usr/bin/apt install -y grub2
		chroot $GYOLI_RootFS /usr/sbin/grub-install --target=i386-pc $GYOLI_DiskDevice --boot-directory=/boot
		echo "GYOLI | info | Boot: Installing Grub to $GYOLI_DiskDevice"
		chroot $GYOLI_RootFS /usr/sbin/grub-mkconfig -o /boot/grub/grub.cfg 
		fi
		if [ $GYOLI_Arch = "amd64" ]; then
		chroot $GYOLI_RootFS /usr/bin/apt install -y grub2
		chroot $GYOLI_RootFS /usr/sbin/grub-install --target=i386-pc $GYOLI_DiskDevice --boot-directory=/boot
		echo "GYOLI | info | Boot: Installing Grub to $GYOLI_DiskDevice"
		chroot $GYOLI_RootFS /usr/sbin/grub-mkconfig -o /boot/grub/grub.cfg 
		fi
	fi
}
