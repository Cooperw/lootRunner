#!/bin/sh
set -e

# setup out runner paths
CONFIG_DIR="/volumes/configs/$RUNNER_NAME"
CONFIG_FILE="$CONFIG_DIR/config.toml"
LEAK_FILE="/volumes/leaks/$RUNNER_NAME.log"

# ensure file paths
mkdir -p "$CONFIG_DIR"
touch "$LEAK_FILE"

# onExit cleanup
cleanup() {
    echo "Unregistering $RUNNER_NAME"
    gitlab-runner unregister --config "$CONFIG_FILE" --name "$RUNNER_NAME" || echo "Error: Unregister failed"
}
trap cleanup EXIT INT TERM

# configure template
TEMP_CONFIG="/tmp/runner-$RUNNER_NAME.toml"
sed "s|__RUNNER_NAME__|$RUNNER_NAME|g" /runner-template.toml > "$TEMP_CONFIG"

# register runner
echo "Registering $RUNNER_NAME"
# modify tags and run-untagged if you know the proper tags
gitlab-runner register --non-interactive \
    --template-config "$TEMP_CONFIG" \
    --url "$GITLAB_URL" \
    --registration-token "$REGISTRATION_TOKEN" \
    --executor "shell" \
    --description "$RUNNER_NAME" \
    --run-untagged="true" \
    --locked="false" \
    --config "$CONFIG_FILE"

gitlab-runner run --config "$CONFIG_FILE" --working-directory /tmp
