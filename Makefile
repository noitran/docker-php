DOCKER_IMAGE ?= 7.4-cli-alpine-latest
TEMPLATE ?= 7.4-cli-alpine
IMAGE_TAG ?= noitran/php:7.4-cli-alpine-latest

build:
	set -eux
	sed -e 's/%%DOCKER_IMAGE%%/$(DOCKER_IMAGE)/g' $(TEMPLATE)/Dockerfile.template > $(TEMPLATE)/Dockerfile
	# https://unix.stackexchange.com/questions/401905/bsd-sed-vs-gnu-sed-and-i
	# OSX uses BSD based version of sed utility
	sed -i '' 's/%%DOCKER_TEMPLATE%%/$(TEMPLATE)/g' $(TEMPLATE)/Dockerfile
	docker build -f $(TEMPLATE)/Dockerfile . -t $(IMAGE_TAG) \
		--build-arg INSTALL_XDEBUG=true \
		--build-arg INSTALL_BZ2=true \
		--build-arg INSTALL_PCOV=true \
		--build-arg INSTALL_PHPREDIS=true \
		--build-arg INSTALL_RDKAFKA=true \
		--build-arg INSTALL_PG_CLIENT=true \
		--build-arg INSTALL_POSTGIS=true \
		--build-arg INSTALL_MYSQL_CLIENT=true \
		--build-arg INSTALL_MONGODB=true \
		--build-arg INSTALL_TAINT=true \
		--build-arg INSTALL_BCMATH=true \
		--build-arg INSTALL_GHOSTSCRIPT=true \
		--build-arg INSTALL_IMAGE_PROCESSORS=true \
		--build-arg INSTALL_IMAGE_OPTIMIZERS=true \
		--build-arg INSTALL_YAML=true \
		--build-arg INSTALL_XMLRPC=true \
		--build-arg INSTALL_COMPOSER=true \
		--build-arg INSTALL_FAKETIME=true
.PHONY: build

test:
	set -eux
	GOSS_FILES_PATH=$(TEMPLATE) dgoss run \
		--env MAXIMAL_BUILD=true \
		--env ENABLE_XDEBUG=true \
		-t $(IMAGE_TAG)
.PHONY: test

clean:
	rm -rf */Dockerfile
.PHONY: clean

docker-push:
	docker push $(IMAGE_TAG)
.PHONY: docker-push
