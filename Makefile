TAG?=latest

build:
	docker build -t stefanprodan/kube-tools:$(TAG) . -f Dockerfile

push:
	docker push stefanprodan/kube-tools:$(TAG)