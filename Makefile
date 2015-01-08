NAME=teamspeak
REPO=edgard/$(NAME)

.PHONY: build start test test-stop run push

all: build

build:
	docker build -t $(REPO) .

start:
	docker run -d --name $(NAME) -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -v /srv/$(NAME):/data $(REPO)

test:
	docker run -d --name $(NAME)-test -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -v /tmp/$(NAME)-test/data:/data $(REPO)

test-stop:
	docker stop $(NAME)-test
	docker rm $(NAME)-test

run:
	docker run -t -i -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -v /tmp/$(NAME)-run/data:/data --rm $(REPO) /bin/bash

push:
	docker push $(REPO)
