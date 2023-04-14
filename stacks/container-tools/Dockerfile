# dependency images
FROM hadolint/hadolint:v2.12.0 AS hadolint

# base image
FROM alpine:3.17.3

# dependencies versions
ARG DOCKLE_VERSION=v0.4.11
ARG KUBECONFORM_VERSION=v0.6.1

# install build dependencies
RUN apk add --no-cache --virtual .build-deps \
    git go

# go deps
ENV CGO_ENABLED=0
RUN go install "github.com/yannh/kubeconform/cmd/kubeconform@${KUBECONFORM_VERSION}" && \
    go install "github.com/goodwithtech/dockle/cmd/dockle@${DOCKLE_VERSION}"

# haskell deps
COPY --from=hadolint /bin/hadolint /usr/bin/hadolint

RUN apk del .build-deps
