.SILENT:

-include .env

container_name ?= devenv
repo = $(docker_username)/$(container_name)
tag ?= local

build:
	docker build -t $(container_name):$(tag) -t $(repo):$(tag) --build-arg username=$(username) --build-arg password=$(password) .

run:
	docker run -it -h $(container_name) --name $(container_name) \
		-v $(shell pwd)/home:/home/$(username) -v $(shell pwd)/dotfiles:/home/$(username)/dotfiles \
		$(container_name):$(tag)

version ?= $(shell date +"%Y-%m-%dT%H%M%S")
commit:
	docker commit $(container_name) $(repo):$(version)
	docker tag $(repo):$(version) $(container_name):$(tag)