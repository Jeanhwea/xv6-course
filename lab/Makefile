SUBDIRS = $(patsubst %/,%,$(shell ls -d */))


all:
	-for d in $(SUBDIRS); do ( \
		[ -f $$d/Makefile ] && $(MAKE) -C $$d \
	); done

clean:
	-for d in $(SUBDIRS); do ( \
		[ -f $$d/Makefile ] && $(MAKE) -C $$d clean \
	); done
