cd ~/vm/disks

[ -f debian-live-12.2.0-amd64-xfce.iso ] || \
    wget -c https://mirrors.tuna.tsinghua.edu.cn/debian-cd/current-live/amd64/iso-hybrid/debian-live-12.2.0-amd64-xfce.iso


qemu-system-x86_64 \
    -smp 4 -m 4G \
    -enable-kvm \
    -hda debian_hd.img -cdrom debian-live-12.2.0-amd64-xfce.iso
