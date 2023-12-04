all: prune build

build:
	docker-compose -f ./srcs/docker-compose.yml up -d --build
#-d or --detach flag: Runs the containers in the background.
#--build flag: Forces a rebuild of the Docker images specified in the docker-

down:
	docker compose -f ./scrs/docker-compose.yml down

prune:
	docker system prune -f
#docker system prune -f: Removes unused Docker objects like containers, networks, images (both dangling and unreferenced), and optionally, volumes.

stop:
	docker stop $$(docker ps -a -q)

clean:
	docker rm -f $$(docker ps -a -q)

cimages:	
	docker rmi $$(docker images -a -q)

images:
	docker images

status:
	docker ps -a

.PHONY: build prune clean images status

#$ sudo systemctl start docker
