#!/bin/sh --posix

read -p "Remove checkpoint - Are you sure? " -n 1 -r

echo

if [ "${REPLY}" = "^[Yy]$" ]
then
    docker checkpoint rm
fi
