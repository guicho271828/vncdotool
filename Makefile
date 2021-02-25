
.phony: build run kill

all: build

build:
	docker build -t vncdotool-test .

run:
	docker run -d -p 5900:5901 vncdotool-test

run-fork:
	docker run -d -p 5901:5901 vncdotool-test
	docker run -d -p 5902:5901 vncdotool-test
	docker run -d -p 5903:5901 vncdotool-test
	docker run -d -p 5904:5901 vncdotool-test
	./test.py fork
	$(MAKE) kill

run-spawn:
	docker run -d -p 5901:5901 vncdotool-test
	docker run -d -p 5902:5901 vncdotool-test
	docker run -d -p 5903:5901 vncdotool-test
	docker run -d -p 5904:5901 vncdotool-test
	./test.py spawn
	$(MAKE) kill

run-forkserver:
	docker run -d -p 5901:5901 vncdotool-test
	docker run -d -p 5902:5901 vncdotool-test
	docker run -d -p 5903:5901 vncdotool-test
	docker run -d -p 5904:5901 vncdotool-test
	./test.py forkserver
	$(MAKE) kill


kill:
	while ! [ -z $$(docker ps -q) ] ; do echo killing ; docker ps -q | xargs docker kill ; done

list:
	docker ps

ls:
	docker ps

