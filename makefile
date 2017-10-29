build:
	docker build -t rqalpha:0.1 .

start:
	docker-compose up -d

enter:
	docker exec -it rqalpha bash

log:
	docker-compose logs

stop:
	docker-compose stop

restart:
	make stop
	make start
