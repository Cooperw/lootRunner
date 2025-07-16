> **⚠️ Legal Disclaimer:**  
> This project is intended for **educational and authorized testing purposes only**.  
> Unauthorized use against systems you do not own or have explicit permission to test **may be illegal**.  
> The authors assume **no liability** for misuse or damages caused by this tool.

---
## Setup: Configure `run-swarm.sh` variables

```bash
TOKENS=("my-runner:glrt-7OE-fs4Fq-KUBE5qQ8h39G86MQpwOjEKdDozCnU6MQ8.01.17168vcp1")
GITLAB_URL="http://gitlab.fake"
RUNNERS_PER_TOKEN=5
```

## Replace discord webhook ping in `runner-template.toml`

```text
https://discord.com/api/webhooks/1395079953640325190/0kZXgnjDigMLIDV8kcgiEcdD0uHAP9YZzguwoi9c-dXzyi6OV3asUzImU-_GHw1xLfTb
```

---

# Build Image

```bash
docker build -t lootrunner .
```

# Run Swarm

```bash
./run-swarm.sh
```

# Cleanup

```bash
./teardown.sh
```

Your leaked data can be found at `./volumes/leaks/`
