define DOCKERFILE
FROM golang:1

WORKDIR /go/src/app
ADD ./src .

RUN go get -d -v ./...
ENV GOOS darwin
ENV GOARCH amd64
RUN go install -v ./...
endef

APP_NAME = build-container
OUT_FILE = app

export DOCKERFILE
build:
	bash -c 'docker build --tag "$(APP_NAME)" --file <(echo "$$DOCKERFILE") .'
	docker run "$(APP_NAME)" cat /go/bin/darwin_amd64/app > "bin/$(OUT_FILE)"
	chmod u+x "bin/$(OUT_FILE)"

.PHONE: build
