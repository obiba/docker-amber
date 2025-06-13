#
# Docker helper
#
tag=1.4
stag=1.4
ctag=1.2
vtag=1.2
no_cache=false

help:
	@echo sudo make all tag=x.x vtag=y.y
	@echo make push-all tag=x.x vtag=y.y

all:
	cd amber && docker build --no-cache=true -t="obiba/amber:$(tag)" . && docker build -t="obiba/amber:latest" .
	cd amber-studio && docker build --no-cache=true -t="obiba/amber-studio:$(stag)" . && docker build -t="obiba/amber-studio:latest" .
	cd amber-collect && docker build --no-cache=true -t="obiba/amber-collect:$(ctag)" . && docker build -t="obiba/amber-collect:latest" .
	cd amber-visit && docker build --no-cache=true -t="obiba/amber-visit:$(vtag)" . && docker build -t="obiba/amber-visit:latest" .

push-all:
	docker image push obiba/amber:$(tag)
	docker image push obiba/amber:latest
	docker image push obiba/amber-studio:$(stag)
	docker image push obiba/amber-studio:latest
	docker image push obiba/amber-collect:$(ctag)
	docker image push obiba/amber-collect:latest
	docker image push obiba/amber-visit:$(vtag)
	docker image push obiba/amber-visit:latest

# Build Docker image
build:
	cd $(app) && docker build --no-cache=$(no_cache) -t="obiba/$(app):$(tag)" .

push:
	docker image push obiba/$(app):$(tag)
