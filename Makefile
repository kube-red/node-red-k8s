IMAGE_NAME = "node-red-k8s"
build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -it --rm -p 1880:1880 $(IMAGE_NAME)
