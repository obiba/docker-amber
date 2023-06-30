#
# Docker helper
#

no_cache=false

help:
	@echo sudo make all tag=x.x

all:
	cd amber && docker build --no-cache=true -t="obiba/amber:$(tag)" . && docker build -t="obiba/amber:latest" . &&\
		docker image obiba/amber:$(tag) && docker image obiba/amber:latest
	cd amber-studio && docker build --no-cache=true -t="obiba/amber-studio:$(tag)" . && docker build -t="obiba/amber-studio:latest" . &&\
		docker image obiba/amber-studio:$(tag) && docker image obiba/amber-studio:latest
	cd amber-collect && docker build --no-cache=true -t="obiba/amber-collect:$(tag)" . && docker build -t="obiba/amber-collect:latest" . &&\
		docker image obiba/amber-collect:$(tag) && docker image obiba/amber-collect:latest

# Build Docker image
build:
	cd $(app) && docker build --no-cache=$(no_cache) -t="obiba/$(app):$(tag)" .

push:
	docker image push obiba/$(app):$(tag)
