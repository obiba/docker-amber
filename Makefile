#
# Docker helper
#

no_cache=false

# Build Docker image
build:
	cd $(app) && docker build --no-cache=$(no_cache) -t="obiba/$(app):$(tag)" .

push:
	docker image push obiba/$(app):$(tag)
