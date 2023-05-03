# build-fhir-profiles
Build FHIR profiles using FSH Sushi

## Usage

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
### Using the `sushi-version` input

Sets sushi version. By default the latest stable release is used.

### Using the `node-version` input

Sets nodejs version to be used for sushi. By default the latest LTS version is used.

### Using the `project-dir` input

This input sets the root directory of the FHIR project. By default the current directory is used.
