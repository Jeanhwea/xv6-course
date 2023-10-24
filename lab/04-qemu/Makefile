QEMU32 = qemu-system-i386
QEMU   = qemu-system-x86_64

DISKS = $(HOME)/vm/disks

xv6:
	$(QEMU) -nographic -smp 2 -m 512 \
	-drive file=$(DISKS)/xv6_hd.img,index=0,media=disk,format=raw \
	-drive file=$(DISKS)/xv6_fs.img,index=1,media=disk,format=raw

xv6_1:
	$(QEMU) -nographic -smp 2 -m 512 -hda $(DISKS)/xv6_hd.img -hdb $(DISKS)/xv6_fs.img

linux-0.11:
	$(QEMU32) -boot a -fda Image -hda hdc-0.11.img

minix:
	$(QEMU) -hda $(DISKS)/minix_x86.img

minix_1:
	$(QEMU) -smp 2 -m 2G -hda $(DISKS)/minix_x86.img

ubuntu:
	$(QEMU) -smp 8 -m 8G \
		-drive file=$(DISKS)/ubuntu_hd.img,media=disk,format=raw \
		-cdrom $(DISKS)/ubuntu-22.04.3-desktop-amd64.iso

ubuntu-server:
	$(QEMU) -smp 8 -m 8G \
		-drive file=$(DISKS)/ubuntu_hd.img,media=disk,format=raw \
		-cdrom $(DISKS)/ubuntu-22.04.3-live-server-amd64.iso
