> **⚠️ Legal Disclaimer:**  
> This project is intended for **educational and authorized testing purposes only**.  
> Unauthorized use against systems you do not own or have explicit permission to test **may be illegal**.  
> The authors assume **no liability** for misuse or damages caused by this tool.

---

# Welcome to lootRunner

**lootRunner** is a simple tool that helps you capitalize on leaked `GLRT` tokens to capture CI/CD variables and project repositories.  
Use it to better understand the risks of runner token leakage and to improve the security posture of your own DevSecOps pipelines.

This tool is primarily aimed at attacking [GitLeaks](https://github.com/gitleaks/gitleaks) `glrt` findings like the one below.
```json
[
 {
  "RuleID": "gitlab-runner-authentication-token",
  "Description": "Discovered a GitLab Runner Authentication Token, posing a risk to CI/CD pipeline integrity and unauthorized access.",
  "StartLine": 3,
  "EndLine": 3,
  "StartColumn": 58,
  "EndColumn": 82,
  "Match": "glrt-7OE-fs4Fq-KUBE5qQ8h39G86MQpwOjEKdDozCnU6MQ8.01.17168vcp1",
  "Secret": "glrt-7OE-fs4Fq-KUBE5qQ8h39G86MQpwOjEKdDozCnU6MQ8.01.17168vcp1",
  "File": "sample-repo-main/example/runner-setup.md",
  "SymlinkFile": "",
  "Commit": "",
  "Entropy": 4.2936606,
  "Author": "",
  "Email": "",
  "Date": "",
  "Message": "",
  "Tags": [],
  "Fingerprint": "sample-repo-main/example/runner-setup.md:gitlab-runner-authentication-token:3"
 }
]
```

### Step 1 [Optional]: Local GitLab Setup & Simulated GLRT Exposure
See [Local GitLab Example README](./example-gitlab/README.md)

### Step 2: Configure lootRunner
See [lootRunner README](./lootRunner/README.md)

