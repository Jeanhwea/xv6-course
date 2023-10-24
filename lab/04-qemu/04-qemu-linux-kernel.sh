cd /data/os/x86_64/buildroot-2023.02.5/output/images

qemu-system-x86_64 \
    -M pc \
    -nographic \
    -kernel bzImage \
    -drive file=rootfs.ext2,if=virtio,format=raw \
    -append "rootwait root=/dev/vda console=tty1 console=ttyS0" \
    -net nic,model=virtio -net user
