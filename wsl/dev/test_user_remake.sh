#!/usr/bin/env bash
set -euo pipefail

echo 'script to remove WSL user and create a new one'

# sudo deluser --remove-home bentest
# if [[ $? -eq 0 ]]; then
#     echo 'User bentest removed'
# else
#     echo 'User bentest not removed'
# fi

sudo adduser bentest --ingroup sudo