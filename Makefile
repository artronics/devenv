.SILENT:

-include .env

container_name ?= devenv
repo = $(docker_username)/$(container_name)
build_version ?= local

build:
	docker build -t $(container_name) -t $(repo):$(build_version) --build-arg username=$(username) --build-arg password=$(password) .

run:
	docker run -it -h $(container_name) --name $(container_name) \
		-v $(shell pwd)/home:/home/$(username) -v $(shell pwd)/dotfiles:/home/$(username)/dotfiles \
		$(container_name)

version ?= $(shell date +"%Y-%m-%dT%H%M%S")
commit:
	docker commit $(container_name) $(repo):$(version)