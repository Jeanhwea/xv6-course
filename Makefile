all: init


clean:
	make -C lab clean

init:
	bear -- make -C lab
