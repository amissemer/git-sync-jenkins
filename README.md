A Jenkins Docker image with a git-backed configuration support
=======

This Docker image is based on the [official Jenkins](https://hub.docker.com/_/jenkins/) Docker image, but adds the capability to manage the configuration of your Jenkins instance in git repositories.

Use-cases
---------
 * Commit the state of your Jenkins instance configuration, when it is ready
 * Spin-off a new instance based on any version of the configuration
 * Upgrade an instance based on changes done on another instance

Usage
-----

Use [this template](https://github.com/amissemer/jenkins-config-template) to get started with this image. Instructions are provided for above use cases.