# Image URL to use all building/pushing image targets
REGISTRY ?= quay.io
REPOSITORY ?= $(REGISTRY)/eformat

PYTHON_TAG ?= 1-104
PYTHON_IMG ?= registry.access.redhat.com/ubi8/python-38:$(PYTHON_TAG)
NOTEBOOK_VERSION ?= 0.4.0
MINIMAL_PY38_NOTEBOOK_IMG := $(REPOSITORY)/minimal-py38-notebook:$(NOTEBOOK_VERSION)

podman-login:
	@podman login -u $(DOCKER_USER) -p $(DOCKER_PASSWORD) $(REGISTRY)

podman-build-notebook-py38:
	podman build --from $(PYTHON_IMG) . -t $(MINIMAL_PY38_NOTEBOOK_IMG) -f python38/Dockerfile

podman-push-notebook-py38: podman-build-notebook-py38
	podman push ${MINIMAL_PY38_NOTEBOOK_IMG }

build: podman-build-notebook-py38

push: podman-push-notebook-py38
