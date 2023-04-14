# dependency images
FROM koalaman/shellcheck-alpine:v0.9.0 AS shellcheck

# base image
FROM alpine:3.17.3

# dependencies versions
ARG CHECKMAKE_VERSION=0.2.1
ARG FILELINT_VERSION=0.8
ARG JSONLINT_VERSION=1.6.3
ARG LINKCHECK_VERSION=0.14
ARG MARKDOWNLINT_VERSION=0.6.0
ARG YAMLLINT_VERSION=1.30.0
ARG JQ_VERSION=1.6
ARG YQ_VERSION=4.33.3
ARG SHFMT_VERSION=3.6.0

# install dependencies
RUN apk add bash make nodejs

# install build dependencies
RUN apk add --no-cache --virtual .build-deps \
    curl freetype-dev gcc git go musl-dev npm python3

# shell deps
RUN curl -o /usr/bin/linkcheck -OL "https://raw.githubusercontent.com/cytopia/linkcheck/${LINKCHECK_VERSION}/linkcheck"
RUN curl -o /usr/bin/awesome-ci-lib.sh -OL "https://raw.githubusercontent.com/cytopia/docker-file-lint/${FILELINT_VERSION}/Dockerfiles/data/awesome-ci-lib.sh" && \
    curl -o /usr/bin/aci-trailing-newline -OL "https://raw.githubusercontent.com/cytopia/docker-file-lint/${FILELINT_VERSION}/Dockerfiles/data/aci-trailing-newline" && \
    curl -o /usr/bin/file-empty -OL "https://raw.githubusercontent.com/cytopia/docker-file-lint/${FILELINT_VERSION}/Dockerfiles/data/file-empty" && \
    curl -o /usr/bin/file-cr -OL "https://raw.githubusercontent.com/cytopia/docker-file-lint/${FILELINT_VERSION}/Dockerfiles/data/file-cr" && \
    curl -o /usr/bin/file-crlf -OL "https://raw.githubusercontent.com/cytopia/docker-file-lint/${FILELINT_VERSION}/Dockerfiles/data/file-crlf" && \
    curl -o /usr/bin/file-nullbyte -OL "https://raw.githubusercontent.com/cytopia/docker-file-lint/${FILELINT_VERSION}/Dockerfiles/data/file-nullbyte" && \
    curl -o /usr/bin/file-trailing-newline -OL "https://raw.githubusercontent.com/cytopia/docker-file-lint/${FILELINT_VERSION}/Dockerfiles/data/file-trailing-newline" && \
    curl -o /usr/bin/file-trailing-single-newline -OL "https://raw.githubusercontent.com/cytopia/docker-file-lint/${FILELINT_VERSION}/Dockerfiles/data/file-trailing-single-newline" && \
    curl -o /usr/bin/file-trailing-space -OL "https://raw.githubusercontent.com/cytopia/docker-file-lint/${FILELINT_VERSION}/Dockerfiles/data/file-trailing-space" && \
    curl -o /usr/bin/file-utf8 -OL "https://raw.githubusercontent.com/cytopia/docker-file-lint/${FILELINT_VERSION}/Dockerfiles/data/file-utf8" && \
    curl -o /usr/bin/file-utf8-bom -OL "https://raw.githubusercontent.com/cytopia/docker-file-lint/${FILELINT_VERSION}/Dockerfiles/data/file-utf8-bom" && \
    curl -o /usr/bin/git-conflicts -OL "https://raw.githubusercontent.com/cytopia/docker-file-lint/${FILELINT_VERSION}/Dockerfiles/data/git-conflicts"
RUN chmod a+x /usr/bin/*

# node.js deps
RUN npm install -g "jsonlint@${JSONLINT_VERSION}" "markdownlint-cli2@${MARKDOWNLINT_VERSION}"

# python deps
RUN python -m ensurepip --upgrade && \
    pip3 install --user "yamllint==${YAMLLINT_VERSION}"

# go deps
ENV CGO_ENABLED=0
RUN go install "github.com/mrtazz/checkmake/cmd/checkmake@${CHECKMAKE_VERSION}" && \
    go install "mvdan.cc/sh/v${SHFMT_VERSION:0:1}/cmd/shfmt@v${SHFMT_VERSION}" && \
    go install "github.com/mikefarah/yq/v${YQ_VERSION:0:1}@v${YQ_VERSION}"

# haskell deps
COPY --from=shellcheck /bin/shellcheck /usr/bin/shellcheck
RUN chmod a+x /usr/bin/shellcheck

# other deps
RUN apk add jq~="${JQ_VERSION}"

RUN apk del .build-deps
