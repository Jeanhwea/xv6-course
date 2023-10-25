cd ~/vm/disks

if [ ! -f minix_R3.3.0-588a35b.iso ]; then
   cat << EOF
Please download images first

   wget -c https://jaist.dl.sourceforge.net/project/archiveos/m/minix/minix_R3.3.0-588a35b.iso.bz2
   bzip2 -d minix_R3.3.0-588a35b.iso.bz2

EOF
   exit 1
fi


qemu-system-x86_64 \
    -smp 4 -m 4G \
    -enable-kvm \
    -hda hd001.img \
    -cdrom minix_R3.3.0-588a35b.iso
