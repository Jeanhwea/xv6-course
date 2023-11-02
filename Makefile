all: build

build:
	make -C lab

clean:
	make -C lab clean

init:
	bear -- make -C lab

publish:
	git push github master
	git push gitee master
	git push github --tags
	git push gitee --tags
