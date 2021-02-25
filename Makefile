
.phony: build run kill

all: build

build:
	docker build -t vncdotool-test .

run-fork:
	docker run -d -p 5901:5901 vncdotool-test
	docker run -d -p 5902:5901 vncdotool-test
	docker run -d -p 5903:5901 vncdotool-test
	docker run -d -p 5904:5901 vncdotool-test
	./test.py fork

run-spawn:
	docker run -d -p 5901:5901 vncdotool-test
	docker run -d -p 5902:5901 vncdotool-test
	docker run -d -p 5903:5901 vncdotool-test
	docker run -d -p 5904:5901 vncdotool-test
	./test.py spawn

run-forkserver:
	docker run -d -p 5901:5901 vncdotool-test
	docker run -d -p 5902:5901 vncdotool-test
	docker run -d -p 5903:5901 vncdotool-test
	docker run -d -p 5904:5901 vncdotool-test
	./test.py forkserver


kill:
	while ! [ -z $$(docker ps -q) ] ; do echo killing ; docker ps -q | xargs docker kill ; done

list:
	docker ps

ls:
	docker ps

