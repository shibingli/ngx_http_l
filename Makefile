NGINX_VERSION:=1.9.15
NDK_VERSION:=0.3.0rc1
ECHO_VERSION:=0.59rc1
IMAGE_NAME=robinmonjo/nginx-module:dev

build:
	docker build --build-arg NGINX_VERSION=$(NGINX_VERSION) --build-arg ECHO_VERSION=$(ECHO_VERSION) --build-arg NDK_VERSION=$(NDK_VERSION) -t $(IMAGE_NAME) .

test: build
	docker run -w /lab/integration/ $(IMAGE_NAME) go test

clean:
	docker rmi -f $(IMAGE_NAME)