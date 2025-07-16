> **⚠️ Legal Disclaimer:**
> This project is intended for **educational and authorized testing purposes only**.
> Unauthorized use against systems you do not own or have explicit permission to test **may be illegal**.
> The authors assume **no liability** for misuse or damages caused by this tool.

---

# Step 1: Setup Mock Environemnt

## Create Instance

```bash
docker compose up -d
```

## Reset root password

#### 1. Enter the running container:

```bash
docker exec -it gitlab /bin/bash
```

#### 2. gitlab-rails console:

```bash
gitlab-rails console
```

#### 3. Find and reset the root user password:

```ruby
user = User.find_by_username('root')
user.password = 'YourNewSecurePassword'
user.password_confirmation = 'YourNewSecurePassword'
user.save!
exit
```

#### 4. Exit the container:

```bash
exit
```

## Create test project

#### 1. Visit [http://gitlab.fake](http://gitlab.fake) and log in as `root:YourNewSecurePassword`

#### 2. Click "Create a project"

#### 3. Select "Create blank project":

* Name: sample-repo
* Leave it public or private (either works)
* Click "Create project"

## Enable CI/CD and Add Test Variables

#### 1. Go to sample-repo

#### 2. Click Settings > CI/CD

#### 3. Expand `General pipelines`

#### 4. Ensure pipelines are enabled

#### 5. Expand `Variables`

#### 6. Add a new variable under `Project variables: CI/CD Variables` (masked and protected, one of each?)

```env
AWS_KEY = AKIA123456789EXAMPLE
AWS_SECRET = wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
```

---

# Step 2: Simulate Token Exposure

#### 1. Navigate to sample-repo → Settings → CI/CD → Runners

#### 2. Create a project runner (untagged, description: my-runner)

#### 3. Click Create-Runner and Select Linux

#### 4. Copy your given runner registration command:

```bash
gitlab-runner register  --url http://gitlab.fake  --token glrt-7OE-fs4Fq-KUBE5qQ8h39G86MQpwOjEKdDozCnU6MQ8.01.17168vcp1
```

#### 5. Add a new `example` directory to `sample-repo`, then add a new file called `runner-setup.md`:

```markdown
If you guys needs to setup a runner for this project, use the following command

gitlab-runner register  --url http://gitlab.fake  --token glrt-7OE-fs4Fq-KUBE5qQ8h39G86MQpwOjEKdDozCnU6MQ8.01.17168vcp1
```

---

# Step 3: Test your runner

#### 1. Install `gitlab-runner`

**Mac:**

```bash
brew install gitlab-runner
```

**Ubuntu:**

```bash
curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
sudo apt install gitlab-runner
```

#### 2. Register clean runner:

```bash
gitlab-runner register  --url http://gitlab.fake  --token glrt-7OE-fs4Fq-KUBE5qQ8h39G86MQpwOjEKdDozCnU6MQ8.01.17168vcp1
```

**Options:**

```text
url: http://gitlab.fake
name: my-runner-01
shell
```

#### 3. Test Runner:

```bash
gitlab-runner run
```

#### 4. Run Pipeline

Go to the pipeline editor, then click `Configure-Pipeline` and `Commit changes`
(I also changed all the sleeps to 10 seconds)

```url
http://gitlab.fake/root/sample-repo/-/ci/editor
```

When the pipeline runs, it should pass and you should see your terminal full of logs about the job.

---

**Congratulations**, you have successfully setup a working CI/CD pipeline in GitLab!
