#!/usr/bin/env bash

# Fetch the container and build it so we have it locally.
singularity run docker://ghcr.io/natcap/devstack:2025-07-01 /bin/bash -c "echo hello world!"
