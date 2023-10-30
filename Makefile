all: init


clean:
	make -c lab clean

init:
	bear -- make -C lab
