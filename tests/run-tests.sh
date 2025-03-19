#!/bin/sh

# Ensure the script is running from the repository root
cd "$(dirname "$0")" || exit 1

for script in t*.sh; do
  if [ -f "$script" ]; then
    if [ ! -x "$script" ]; then
      chmod u+x "$script"
    fi

    ./"$script"
  else
    echo "Skipping: $script (not a file)"
  fi
done