# maven

[![CI](https://github.com/lsst-it/puppet-maven/actions/workflows/ci.yml/badge.svg)](https://github.com/lsst-it/puppet-maven/actions/workflows/ci.yml)
[![markdownlint](https://github.com/lsst-it/puppet-maven/actions/workflows/markdownlint.yaml/badge.svg)](https://github.com/lsst-it/puppet-maven/actions/workflows/markdownlint.yaml)
[![shellcheck](https://github.com/lsst-it/puppet-maven/actions/workflows/shellcheck.yaml/badge.svg)](https://github.com/lsst-it/puppet-maven/actions/workflows/shellcheck.yaml)
[![yamllint](https://github.com/lsst-it/puppet-maven/actions/workflows/yamllint.yaml/badge.svg)](https://github.com/lsst-it/puppet-maven/actions/workflows/yamllint.yaml)

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with maven](#setup)
  * [What maven affects](#what-maven-affects)
  * [Setup requirements](#setup-requirements)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)

## Description

Installs maven (`mvn`) from Apache official binary tarball releases.

## Setup

### What maven affects

* unpacks tarballs under `/opt/maven`
* creates `/etc/profile.d/maven.sh`

### Setup Requirements **OPTIONAL**

None.

## Usage

### Basic Example

```puppet
include maven
```

### Pedantic Example

```yaml
classes:
  - "maven"

maven::version: "3.6.3"
maven::base_path: "/opt/maven"
maven::url: ~
```

## Reference

See [REFERENCE](REFERENCE.md).
