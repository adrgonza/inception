all: prune build

build:
	docker-compose -f srcs/docker-compose.yml build

prune:
	docker system prune -f

clean:
	docker stop $(docker ps -a -q)
	docker rmi $(docker images -a -q)
	docker rm -f $(docker ps -a -q)

images:
	docker images

status:
	docker ps -a

.PHONY: build prune clean images status

#$ sudo systemctl start docker
