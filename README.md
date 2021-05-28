# GYOLI: Generate Your Own Linux Image


GYOLI.sh linuxdistro arch hardware diskblockdevice

example:

GYOLI_Hardware=bios GYOLI_Distro=debian-10 GYOLI_Arch=amd64 GYOLI_DiskDevice=/dev/nbd0 ./GYOLI.sh 

#### Main settings:
|Option|Value|default value|value format|desciption|
|---|---|---|---|---|
|GYOLI_Hardware|string|bios||Hardware Type|
|GYOLI_Distro|string|debian-10||Distro|
|GYOLI_Arch|string|amd64||Root Architecture|
|GYOLI_DiskDevice|string|none||Disk Device|
---

--- Distro List ---

debian-10

--- Machine List ---

bios (i386 and amd64)

--- Arch List ---

alpha
armel
armhf
arm64
hppa
i386
amd64
ia64
m68k
mips
mipsel
mips64el
powerpc
ppc64
ppc64el
riscv64
s390
s390x
sh4
sparc
sparc64
x32
