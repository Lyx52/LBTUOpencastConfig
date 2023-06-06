OPENCAST_REPO     ?= https://github.com/opencast/opencast.git
OPENCAST_VERSION  ?= $(shell cat VERSION_OPENCAST)

FFMPEG_VERSION    ?= $(shell cat VERSION_FFMPEG)

IMAGE_TAG         ?= $(shell cat VERSION)
IMAGE_TAG_MAJOR   ?= $(shell cat VERSION_MAJOR)
GIT_COMMIT        ?= $(shell git rev-parse --short HEAD || echo "unknown")
BUILD_DATE        ?= $(shell date -u +"%Y-%m-%dT%TZ")

# build variables (do not change)

export DOCKER_BUILDKIT = 1
OPENCAST_DISTRIBUTIONS = \
	admin \
	adminpresentation \
	allinone \
	ingest \
	presentation \
	worker

# targets

all: build

.PHONY: build
build: $(addprefix build-, $(OPENCAST_DISTRIBUTIONS)) build-build
build-%:
	docker build \
		--pull \
		--build-arg OPENCAST_REPO="$(OPENCAST_REPO)" \
		--build-arg OPENCAST_VERSION="$(OPENCAST_VERSION)" \
		--build-arg OPENCAST_DISTRIBUTION="$*" \
		--build-arg FFMPEG_VERSION="$(FFMPEG_VERSION)" \
		--build-arg BUILD_DATE="$(BUILD_DATE)" \
		--build-arg GIT_COMMIT="$(GIT_COMMIT)" \
		--build-arg VERSION="$(IMAGE_TAG)" \
		-t "lbtu-opencast:latest" \
		-t "lbtu-opencast:$(IMAGE_TAG)" \
		-t "lbtu-opencast:$(IMAGE_TAG_MAJOR)" \
		$(DOCKER_BUILD_ARGS) \
		-f Dockerfile \
		.