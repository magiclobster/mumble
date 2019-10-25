#!/usr/bin/env bash

if [[ $# -eq 1 ]] ; then
  /usr/sbin/murmurd -ini /mumble/murmur.sqlite -supw ${1}
fi
