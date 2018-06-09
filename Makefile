run:
	ruby main.rb

setup:
	bundle install --local

vendor:
	bundle pack --all

build: docker-build

docker-build:
	sudo docker build -t lungpin/sinatra .

docker-run:
	sudo docker run -it -p 8080:8080 lungpin/sinatra

docker-push:
	docker push lungpin/sinatra
