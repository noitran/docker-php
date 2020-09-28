DOCKER_IMAGE ?= noitran\/php-base:7.4-fpm-alpine-latest
TEMPLATE ?= 7.4-fpm-alpine
IMAGE_TAG ?= noitran/php:7.4-fpm-alpine-latest

build:
	sed -e 's/%%DOCKER_IMAGE%%/$(DOCKER_IMAGE)/g' $(TEMPLATE)/Dockerfile.template > $(TEMPLATE)/Dockerfile
	docker build -f $(TEMPLATE)/Dockerfile . -t $(IMAGE_TAG) \
		--build-arg INSTALL_BZ2=false \
		--build-arg INSTALL_RDKAFKA=false \
		--build-arg INSTALL_PG_CLIENT=false \
		--build-arg INSTALL_POSTGIS=false \
		--build-arg INSTALL_MYSQL_CLIENT=false \
		--build-arg INSTALL_TAINT=false \
		--build-arg INSTALL_BCMATH=false \
		--build-arg INSTALL_GHOSTSCRIPT=false \
		--build-arg INSTALL_IMAGE_PROCESSORS=true \
		--build-arg INSTALL_IMAGE_OPTIMIZERS=true \
		--build-arg INSTALL_YAML=false \
		--build-arg INSTALL_XMLRPC=false \
		--build-arg INSTALL_FAKETIME=false \
		--build-arg INSTALL_COMPOSER=false \
		--build-arg INSTALL_MONGODB=true
.PHONY: build

test:
	GOSS_FILES_PATH=$(TEMPLATE) dgoss run -t $(IMAGE_TAG)
.PHONY: test

clean:
	rm -rf */Dockerfile
.PHONY: clean

docker-push:
	docker push $(IMAGE_TAG)
.PHONY: docker-push
