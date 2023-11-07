all: prune build

build:
	docker-compose -f srcs/docker-compose.yml build

prune:
	docker system prune -f

images:
	docker images

status:
	docker ps -a

.PHONY: build prune images status 

#$ sudo systemctl start docker