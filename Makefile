MODELS_PATH := `pwd`/models
DOCKER_BIN := `which docker`
TAG := "heycar/tensorflow-model-server:0.4.0"

.PHONY: build
build:
	$(DOCKER_BIN) build . -t $(TAG)

.PHONY: push
push:
	$(DOCKER_BIN) push $(TAG)

.PHONY: release
release: build push

.PHONY: run
run:
	$(DOCKER_BIN) run --rm -it -p 127.0.0.1:7000:7000 -v $(MODELS_PATH):/tensorflow/models $(TAG)
