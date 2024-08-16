# build-fhir-profiles

[![Docker Images](https://github.com/cybernop/build-fhir-profiles/actions/workflows/docker.yml/badge.svg)](https://github.com/cybernop/build-fhir-profiles/actions/workflows/docker.yml)

## Action
Build FHIR profiles using FSH Sushi

### Usage

see [action.yaml](action.yaml)

```yaml
steps:
  - uses: actions/checkout@v3
  - uses: cybernop/fill-fhir-cache@v1
    with:
      project-dir: "."
  - uses: cybernop/build-fhir-profiles@v1
    with:
      sushi-version: 2.10.1
      node-version: 18
      project-dir: "."
```
#### Using the `sushi-version` input

Sets sushi version. By default the latest stable release is used.

#### Using the `node-version` input

Sets nodejs version to be used for sushi. By default the latest LTS version is used.

#### Using the `project-dir` input

This input sets the root directory of the FHIR project. By default the current directory is used.

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

