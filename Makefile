
E2E_REGISTRY := docker.io/inspurwyd
E2E_TAG := latest
GIT_COMMIT_VERSION = $(shell git show -s --format='format:%H')
GIT_COMMIT_TIME = $(shell git show -s --format='format:%aI')

.DEFAULT_GOAL:=help

.EXPORT_ALL_VARIABLES:

ifndef VERBOSE
.SILENT:
endif

# set default shell
SHELL=/bin/bash -o pipefail -o errexit

.PHONY: image
image:
	@echo "Build and push Image:  $(E2E_REGISTRY):$(E2E_TAG) "
	docker buildx build  --build-arg GIT_COMMIT_VERSION=$(GIT_COMMIT_VERSION) \
                        --no-cache \
                        --push \
                        --progress plain \
			--build-arg GIT_COMMIT_TIME=$(GIT_COMMIT_TIME) \
			--tag  docker.io/inspurwyd/cilium-chain:$(E2E_TAG) . ; \
	echo "image build and push success" ; \
