VERSION ?= $(shell cat VERSION)
APP=csv2bars

.PHONY: help build run
.DEFAULT_GOAL := help


help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


build:  ## build image
	docker build -t csv2bars .

run:  ## run container
	docker run --rm -it -p 8080:80 csv2bars
