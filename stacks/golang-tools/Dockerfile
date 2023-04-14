FROM golang:1.20.3-alpine3.17

# Go Dependencies
ENV GCI_VERSION="v0.10.1"
ENV GINKGO_VERSION="v2.9.2"
ENV GO_COVER_TREEMAP_VERSION="v1.3.0"
ENV GOFUMPT_VERSION="v0.5.0"
ENV GOIMPORTS_VERSION="v0.8.0"
ENV GOLANGCI_LINT_VERSION="v1.52.2"

ENV CGO_ENABLED=0

RUN go install "github.com/daixiang0/gci@${GCI_VERSION}" && \
    go install "github.com/golangci/golangci-lint/cmd/golangci-lint@${GOLANGCI_LINT_VERSION}" && \
    go install "github.com/nikolaydubina/go-cover-treemap@${GO_COVER_TREEMAP_VERSION}" && \
    go install "github.com/onsi/ginkgo/v2/ginkgo@${GINKGO_VERSION}" && \
    go install "golang.org/x/tools/cmd/goimports@${GOIMPORTS_VERSION}" && \
    go install "mvdan.cc/gofumpt@${GOFUMPT_VERSION}"
