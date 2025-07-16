

Setup: Configure `run-swarm.sh`
```
TOKENS=("my-runner:glrt-7OE-fs4Fq-KUBE5qQ8h39G86MQpwOjEKdDozCnU6MQ8.01.17168vcp1")
GITLAB_URL="http://gitlab.fake"
RUNNERS_PER_TOKEN=5
```

Replace discord webhook ping in `runner-template.toml`
```
https://discord.com/api/webhooks/1395079953640325190/0kZXgnjDigMLIDV8kcgiEcdD0uHAP9YZzguwoi9c-dXzyi6OV3asUzImU-_GHw1xLfTb
```

# Build Image
docker build -t lootrunner .

# Run Swarm
./run-swarm.sh

# Cleanup
./teardown.sh
