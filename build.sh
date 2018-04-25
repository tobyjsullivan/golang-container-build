#!/usr/bin/env bash
set -ueo pipefail

build_container() {
  local container_tag="$1"
  local os="$2"
  local arch="$3"

  docker build --tag "${container_tag}" --file <(cat <<DOCKERFILE
FROM golang:1

WORKDIR /go/src/app
ADD ./src .

ENV GOOS=${os}
ENV GOARCH=${arch}
RUN go get -d -v ./...
RUN go install -v ./...
DOCKERFILE
) .
}

extract_app() {
  local container_tag="$1"
  local os="$2"
  local arch="$3"
  local out_file="$4"

  docker run "${container_tag}" cat "/go/bin/${os}_${arch}/app" > "${out_file}"
	chmod u+x "${out_file}"
}

main() {
  local container_tag="build-container"
  local target_os="darwin"
  local target_arch="amd64"
  local out_file="bin/app"

  build_container "${container_tag}" "${target_os}" "${target_arch}"
  extract_app "${container_tag}" "${target_os}" "${target_arch}" "${out_file}"
}

main "$@"
