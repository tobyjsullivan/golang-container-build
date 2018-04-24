SHELL = bash
GOOS = darwin
GOARCH = amd64
APP_NAME = build-container
OUT_FILE = app

define DOCKERFILE
FROM golang:1

WORKDIR /go/src/app
ADD ./src .

RUN go get -d -v ./...
ENV GOOS "$(GOOS)"
ENV GOARCH "$(GOARCH)"
RUN go install -v ./...
endef


export DOCKERFILE
build:
	docker build --tag "$(APP_NAME)" --file <(echo "$$DOCKERFILE") .
	docker run "$(APP_NAME)" cat /go/bin/darwin_amd64/app > "bin/$(OUT_FILE)"
	chmod u+x "bin/$(OUT_FILE)"

.PHONE: build
