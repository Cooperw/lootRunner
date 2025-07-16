#!/bin/bash

echo "[+] Force-removing all lootRunner containers..."

# Force remove all containers based on lootrunner image
for cid in $(docker ps -q --filter ancestor=lootrunner); do
  name=$(docker inspect --format '{{.Name}}' "$cid" | sed 's/\///')
  echo "[+] Killing and removing container: $name"
  docker rm -f "$cid"
done

# Unregister all runners and clean up config dir if successful
for config in volumes/configs/*/config.toml; do
  dir="$(dirname "$config")"
  runner_name="$(basename "$dir")"
  echo "[+] Unregistering runner: $runner_name"
  if gitlab-runner unregister --config "$config" --name "$runner_name"; then
    echo "[+] Unregister successful, removing: $dir"
    rm -rf "$dir"
  else
    echo "[-] Failed to unregister: $runner_name"
  fi
done

# Clean up empty logs
echo "[+] Removing empty logs..."
find volumes/leaks -type f -name "*.log" -empty -print -delete

echo "[+] Teardown & Cleanup complete."
