ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SHELL := /bin/bash

.PHONY: build-solos

build-solos:
	@echo "TODO"

.PHONY: build-stacks
.PHONY: build-container-tools build-file-tools build-golang-tools

build-stacks: build-file-tools build-container-tools build-golang-tools

build-file-tools:
	@docker buildx build \
		--platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
		--tag mecha-ci/file-tools:latest ./stacks/file-tools

build-container-tools:
	@docker buildx build \
		--platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
		--tag mecha-ci/container-tools:latest ./stacks/container-tools

build-golang-tools:
	@docker buildx build \
		--platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
		--tag mecha-ci/golang-tools:latest ./stacks/golang-tools

.PHONY: push-all

push-all: push-solos push-stacks

.PHONY: push-solos

push-solos:
	@echo "TODO"

.PHONY: push-stacks

push-stacks: push-file-tools push-container-tools push-golang-tools

push-file-tools:
	@docker push mecha-ci/file-tools:latest

push-container-tools:
	@docker push mecha-ci/container-tools:latest

push-golang-tools:
	@docker push mecha-ci/golang-tools:latest
