FROM golang:1

WORKDIR /go/src/app
ADD ./src .

RUN go get -d -v ./...
ENV GOOS darwin
ENV GOARCH amd64
RUN go install -v ./...

