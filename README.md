![Build status](https://img.shields.io/github/actions/workflow/status/docker-ThoTeam/molecule_apache_openjdk8/build-and-push.yml) ![Docker Stars](https://img.shields.io/docker/stars/thoteam/molecule_apache_openjdk8.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/thoteam/molecule_apache_openjdk8.svg)
# molecule_apache_openjdk8
Init enabled image with apache and openjdk8 to test ansible roles with molecule.

This is primarely used to test the [ansible-Thoteam.nexus3-oss ansible role](https://github.com/ansible-ThoTeam/nexus3-oss/)
but you are welcome to use it elsewhere and to provide feedback or PRs.

This image does not hava a latest tag. See https://hub.docker.com/r/thoteam/molecule_apache_openjdk8/tags for available ones.

For users reading from dockerhub:
All tags are built from the corresponding [github repository](https://github.com/docker-ThoTeam/molecule_apache_openjdk8)
whenever a change is introduced. An automatic build is also scheduled every Sunday at midnight from a fresh base image.
