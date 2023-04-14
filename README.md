# Mecha CI Images

This repository contains the Dockerfiles for the images offered by Mecha CI.

It is divided into two main directories: `solos` and `stacks`: the former contains single-tool images, such as yamllint, while the latter contains "stacks" of multiple tools, and they are designed for a larger, yet cohesive use-case, such as golang development or ci automation.
`Stacks` are opinionated collections of tools, hence they might not be suitable for all use-cases; the idea is to keep them highly cohesive and lowly coupled, to maximize usefulness and reuse.

## Available Stacks

### File Tools

To be used for checking files for common, character-level issues such as trailing whitespace or mixed line endings.

Installed tools:

|     Name     | Version  |
|--------------|----------|
| checkmake    | `0.2.1`  |
| filelint     | `0.8`    |
| jq           | `1.6`    |
| jsonlint     | `1.6.3`  |
| linkcheck    | `0.14`   |
| markdownlint | `0.6.0`  |
| shellcheck   | `0.9.0`  |
| shfmt        | `3.6.0`  |
| yamllint     | `1.30.0` |
| yq           | `4.33.3` |

### Container Tools

To be used for analyzing and linting containers, images and kubernetes manifests.

Installed tools:

|     Name     | Version  |
|--------------|----------|
| dockle       | `0.8`    |
| hadolint     | `2.12.0` |
| kubeconform  | `1.6`    |

### Golang Tools

To be used for linting and testing golang projects.

Installed tools:

|       Name       | Version  |
|------------------|----------|
| gci              | `0.10.1` |
| ginkgo           | `2.9.2`  |
| go_cover_treemap | `1.3.0`  |
| gofumpt          | `0.5.0`  |
| goimports        | `0.8.0`  |
| golangci_lint    | `1.52.2` |
