.DEFAULT_GOAL := help

IMAGE_TAG := "duckdns"

build: ## build the image
	docker build . -t ${IMAGE_TAG}

start: ## start existing container
	docker start ${IMAGE_TAG}

stop: ## stop existing container
	docker stop ${IMAGE_TAG}

rm: ## remove existing container
	docker rm ${IMAGE_TAG}

attach-it: ## attach to existing container on interactive mode
	docker exec -it ${IMAGE_TAG} bash

help: ## show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
