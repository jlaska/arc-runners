REGISTRY := ghcr.io/jlaska/arc-runners
TAG := local

.PHONY: build build-homelab-core build-homelab-pr-impact test test-homelab-core test-homelab-pr-impact

build: build-homelab-core build-homelab-pr-impact

build-homelab-core:
	docker build -t $(REGISTRY)/homelab-core:$(TAG) homelab-core/

build-homelab-pr-impact:
	docker build -t $(REGISTRY)/homelab-pr-impact:$(TAG) homelab-pr-impact/

test: test-homelab-core test-homelab-pr-impact

test-homelab-core: build-homelab-core
	docker run --rm $(REGISTRY)/homelab-core:$(TAG) bash -c \
	  'python3 -m pip --version && pip install --user yamllint pre-commit detect-secrets && yamllint --version && pre-commit --version'

test-homelab-pr-impact: build-homelab-pr-impact
	docker run --rm $(REGISTRY)/homelab-pr-impact:$(TAG) bash -c \
	  'gh --version && helm version --short && crane version && uv --version && kubectl version --client && claude --version'
