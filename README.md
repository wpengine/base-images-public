# base-images-public

This repository contains Dockerfiles and configuration scripts for Docker images containing various utilities. The resulting images are typically hosted on Docker Hub via automated builds. These automated builds look for changes in this repo and will tag any updated images with latest (as long as they're in the master branch).

If you would like to test an image, you can push to a branch with the branch-name called {image-you-care-about}-new-version, and docker-hub will publish a new image that is tagged terraform-new-version. For example, say I want to test a new terraform version... I could push a branch named terraform-0.11.7, and dockerhub will build a new terraform image with the tag terraform-0.11.7.

## Adding new images

To add a new image to be managed by this repository and automatically built, see the Confluence Wiki article named "How to add to base-images-public".
