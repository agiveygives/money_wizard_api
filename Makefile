init:
	docker-compose build
	docker-compose up -d
	bundle exec rails db:setup

start:
	docker-compose up -d
	bundle exec rails s
