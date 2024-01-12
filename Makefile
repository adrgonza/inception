all: prune build

build:
	mkdir /home/adrgonza/data/wp /home/adrgonza/data/db || true
	docker-compose -f ./srcs/docker-compose.yml up  --build

down:
	docker compose -f ./scrs/docker-compose.yml down

prune:
	docker system prune -f

stop:
	docker stop $$(docker ps -a -q)

clean:
	docker rm -f $$(docker ps -a -q) || true
	rm -rf /home/adrgonza/data/wp /home/adrgonza/data/db

cimages:	
	docker rmi $$(docker images -a -q)

images:
	docker images

status:
	docker ps -a

.PHONY: build down  prune stop clean cimages images status
