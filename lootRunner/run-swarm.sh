#!/bin/bash

### Runner definitions ###
TOKENS=("my-runner:glrt-7OE-fs4Fq-KUBE5qQ8h39G86MQpwOjEKdDozCnU6MQ8.01.17168vcp1")
GITLAB_URL="http://gitlab.fake" # GITLAB_URL="http://localhost" # do not use localhost
RUNNERS_PER_TOKEN=5

for entry in "${TOKENS[@]}"; do
  base_name="${entry%%:*}"
  token="${entry#*:}"
  
  for i in $(seq 1 $RUNNERS_PER_TOKEN); do
    name="${base_name}-$(printf "%02d" $i)"
    echo "[+] Spawning $name"

    docker run -d \
      --name "$name" \
      --add-host=gitlab.fake:192.168.65.254 \
      -e GITLAB_URL="$GITLAB_URL" \
      -e REGISTRATION_TOKEN="$token" \
      -e RUNNER_NAME="$name" \
      -v "$(pwd)/volumes/configs:/volumes/configs" \
      -v "$(pwd)/volumes/leaks:/volumes/leaks" \
      lootrunner
  done
done
