MODELS_PATH := `pwd`/models
DOCKER_BIN := `which docker`
TAG_OLD := "heycar/tensorflow-model-server:2.1.0"
TAG := "heycar-classification-model-server"

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
	$(DOCKER_BIN) run --rm -it -p 127.0.0.1:8500:8500 -p 127.0.0.1:8501:8501 -v $(MODELS_PATH):/models -e MODEL_NAME=new_banner  $(TAG)
