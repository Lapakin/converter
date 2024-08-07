DOCKER_BAKE_FILE := -f Makefile.docker-bake.hcl
ALPINE_VERSION := 3.19

DOCKER_META_IMAGES := krelms/converter
DOCKER_META_VERSION := 1.0

build:
	DOCKER_META_IMAGES=${DOCKER_META_IMAGES} DOCKER_META_VERSION=${DOCKER_META_VERSION} docker buildx bake --load $(DOCKER_BAKE_FILE)

push:
	docker push ${DOCKER_META_IMAGES}:${DOCKER_META_VERSION}

run:
	docker run -it --rm ${DOCKER_META_IMAGES}:${DOCKER_META_VERSION}

shell:
	docker run -it --rm ${DOCKER_META_IMAGES}:${DOCKER_META_VERSION} sh
