
E2E_REGISTRY := docker.io/cilium-chaining
E2E_TAG := latest
GIT_COMMIT_VERSION = $(shell git show -s --format='format:%H')
GIT_COMMIT_TIME = $(shell git show -s --format='format:%aI')


.PHONY: image
image:
	@echo "Build Image:  $(E2E_REGISTRY):$(E2E_TAG) "
	docker buildx build  --build-arg GIT_COMMIT_VERSION=$(GIT_COMMIT_VERSION) \
			--build-arg GIT_COMMIT_TIME=$(GIT_COMMIT_TIME) \
			--file Dockerfile \
			--output type=docker --tag  docker.io/inspurwyd:$(E2E_TAG) . ; \
	echo "image build success" ; \
