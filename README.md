# build-fhir-profiles

[![Docker Images](https://github.com/cybernop/build-fhir-profiles/actions/workflows/docker.yml/badge.svg)](https://github.com/cybernop/build-fhir-profiles/actions/workflows/docker.yml) ![Latest Sushi Version](https://img.shields.io/badge/Latest%20Sushi%20Version-3.11.0-blue.svg)

This repository provides a github action and a Docker image to build FHIR profiles using FSH Sushi.

## github Action

This github action builds FHIR profiles using FSH Sushi and Firely Terminal. The Firely Terminal is used to download and inflate the project dependencies before building the JSON files using FSH Sushi.

see [action.yaml](action.yaml)

```yaml
steps:
  - uses: actions/checkout@v3
  - uses: cybernop/build-fhir-profiles@v2
    with:
      project-dir: "."
      sushi-version: 3.11.0
      firely-terminal-version: 3.1.0
      node-version: lts/*
      dotnet-version: 6.0.x
```

### Parameters

#### Input

| Name | Description | Required | Default |
| --- | --- | :-: | :-: |
| `project-dir` | Root directory of the FSH Sushi project | False | `.` |
| `sushi-version` | Version of FSH sushi for building | True | - |
| `firely-terminal-version` | Version of Firely Terminal | True | - |
| `node-version` | Version of NodeJS | False | `lts/*` |
| `dotnet-version` | Version of .NET | False | `6.0.x` |

## Docker Image

The build information can be found in `docker/`.

Build FHIR profiles for FSH sushi project in `<project dir>`.

```bash
docker run --rm -u $(id -u):$(id -g) \
    -v <project dir>:/project \
    ghcr.io/cybernop/build-fhir-profiles:<sushi version>
```

With `<sushi version>` one can specify which version of FSH Sushi to use for checking. Currently the following versions are supported:

* `3.11.0`

### Script

A convenience script can be downloaded

```bash
wget https://raw.githubusercontent.com/cybernop/build-fhir-profiles/main/docker/scripts/build-fhir-profiles.sh
```

set executable permissions

```bash
chmod a+x build-fhir-profiles.sh
```

Call the script with

```bash
[SUSHI_VERSION=<sushi version>] build-fhir-profiles.sh [<project dir>]
```

