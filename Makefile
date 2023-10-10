up:
	make db-up
	make spy-up

destroy:
	make spy-destroy
	make db-destroy

down:
	make spy-down
	make db-down

db-up:
	docker compose up -d
db-down:
	docker compose down --remove-orphans
db-destroy:
	docker compose down --rmi all --volumes

spy-up:
	docker compose -f docker-compose-spy.yml up --build --force-recreate spy
	docker rm spy
	docker compose -f docker-compose-spy.yml up -d --build nginx_schemaspy
spy-down:
	docker compose -f docker-compose-spy.yml down --remove-orphans
spy-destroy:
	docker compose -f docker-compose-spy.yml down --rmi all --volumes