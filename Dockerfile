FROM debian:stable-slim

LABEL "version"="1.0.0"
LABEL "com.github.actions.name"="Git Credentials Writer for GitHub Actions"
LABEL "com.github.actions.description"="common actions for setting up git credentials"
LABEL "com.github.actions.icon"="log-in"
LABEL "com.github.actions.color"="gray-dark"

RUN apt-get update && \
  apt-get install --no-install-recommends -y \
  git && \
  rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
