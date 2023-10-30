all: init

pub:
	git push github master
	git push gitee master
	git push github --tags
	git push gitee --tags

clean:
	make -C lab clean

init:
	bear -- make -C lab
