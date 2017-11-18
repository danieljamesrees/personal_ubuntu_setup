#!/bin/sh --posix

# Write the content of the container memory.
# The checkpoint may not always be consistent with the volume content, due to content changes only made in Docker memory (saved to the Docker checkpoint) not on disk.
# Important data is version controlled.
# Permanent changes to workstation software should be performed by updating and running Ansible code. This Ansible code would also be run on clean runs of the docker image (when the image has been removed, not just stopped).
docker checkpoint create

# Make sure any volumes (written to Dropbox etc.) are inactive/consistent.
docker stop

shutdown now
