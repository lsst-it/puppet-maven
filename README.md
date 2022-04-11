# maven

[![Build Status](https://travis-ci.com/lsst-it/puppet-maven.svg?branch=master)](https://travis-ci.com/lsst-it/puppet-maven)

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
