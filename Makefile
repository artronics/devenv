-include .env

build:
	docker build -t devenv --build-arg username=jalal password=$password .
run:
	docker run --rm -it -h dev --name devenv --entrypoint /bin/bash devenv