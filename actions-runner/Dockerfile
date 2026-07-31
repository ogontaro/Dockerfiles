# https://github.com/actions/runner/blob/main/images/Dockerfile
FROM ghcr.io/actions/actions-runner:latest

USER root
RUN buildDeps="gnupg2 software-properties-common python3-pip python3-venv" && \
  apt-get update && \
  apt-get install -y --no-install-recommends curl git gh python3 $buildDeps && \
  ARCH=$(uname -m) && \
  if [ "$ARCH" = "x86_64" ]; then ARCH="amd64"; \
  elif [ "$ARCH" = "aarch64" ]; then ARCH="arm64"; \
  elif [ "$ARCH" = "armv7l" ]; then ARCH="arm"; \
  fi && \
  curl -L "https://github.com/mikefarah/yq/releases/latest/download/yq_linux_${ARCH}" -o /usr/local/bin/yq && \
  chmod +x /usr/local/bin/yq && \
  # apt版pipx(Ubuntu 24.04時点で1.4.3)は`install --global`に未対応のため、pipxはpipで最新版を入れる。
  # ベースイメージがPython 3.12(PEP 668 externally-managed-environment)になったため--break-system-packagesが必要。
  pip3 install --no-cache-dir --break-system-packages pipx && \
  pipx ensurepath && \
  pipx install --global copier && \
  SUDO_FORCE_REMOVE=yes apt purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDeps && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

USER runner
