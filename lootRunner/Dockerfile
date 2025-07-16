FROM gitlab/gitlab-runner:alpine

COPY entrypoint.sh /entrypoint.sh
COPY runner-template.toml /runner-template.toml
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
