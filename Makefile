IMG_NS?=MUST_SPECIFIED
IMG_TAG?=latest
SERVICE=datax-web
IMG=datax-web

datax-image="$(IMG_NS)/datax:$(IMG_TAG)"
datax-web-image="$(IMG_NS)/datax-web:$(IMG_TAG)"

all: datax datax-web

datax: datax-image datax-push
datax-web: datax-web-image datax-web-push

datax-image:
	@echo building $(datax-image) ...
	@docker build -t $(datax-image) -f addax.Dockerfile .

datax-push:
	@echo pushing $(datax-image) ...
	@docker push $(datax-image)

datax-web-image:
	@echo building $(datax-web-image) --build-arg BASE=$(datax-image) ...
	@docker build -t $(datax-web-image) --build-arg BASE=$(datax-image) .

datax-web-push:
	@echo pushing $(datax-web-image) ...
	@docker push $(datax-web-image)
