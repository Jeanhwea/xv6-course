cd /data/os/minix/obj.i386/work

qemu-system-i386 \
    --enable-kvm \
    -m 1G \
    -kernel kernel \
    -append "bootramdisk=1" \
    -initrd "mod01_ds,mod02_rs,mod03_pm,mod04_sched,mod05_vfs,mod06_memory,mod07_tty,mod08_mib,mod09_vm,mod10_pfs,mod11_mfs,mod12_init"
