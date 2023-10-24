cd ~/code/gitana/os/xv6-public

qemu-system-i386 -smp 2 -m 512 -nographic -hda xv6.img -hdb fs.img
