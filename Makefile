all: init

pub:
	git push github master
	git push gitee master

clean:
	make -C lab clean

init:
	bear -- make -C lab
