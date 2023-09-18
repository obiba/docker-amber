#
# Docker helper
#

no_cache=false
tag=snapshot

help:
	@echo sudo make all
	@echo make push-all

snapshots: all push-all

all:
	cd amber && docker build --no-cache=true -t="obiba/amber:$(tag)" .
	cd amber-studio && docker build --no-cache=true -t="obiba/amber-studio:$(tag)" .
	cd amber-collect && docker build --no-cache=true -t="obiba/amber-collect:$(tag)" .
	cd amber-visit && docker build --no-cache=true -t="obiba/amber-visit:$(tag)" .

push-all:
	docker image push obiba/amber:$(tag)
	docker image push obiba/amber-studio:$(tag)
	docker image push obiba/amber-collect:$(tag)
	docker image push obiba/amber-visit:$(tag)
	
# Build Docker image
build:
	cd $(app) && docker build --no-cache=$(no_cache) -t="obiba/$(app):$(tag)" .

push:
	docker image push obiba/$(app):$(tag)
