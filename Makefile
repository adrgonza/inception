build:
	docker-compose -f srcs/docker-compose.yml build

images:
	docker images

status:
	docker ps

.PHONY: build
