FROM denoland/deno:bin AS deno
FROM bitnami/kubectl:latest AS kubectl

FROM ubuntu:22.04

ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    awscli \
    bat \
    curl \
    gdb \
    git \
    dnsutils \
    fd-find \
    fzf \
    htop \
    iproute2 \
    lsof \
    jq \
    fish \
    ncdu \
    net-tools \
    python3 \
    python3-pip \
    ripgrep \
    strace \
    tree \
    tmux \
    unzip \
    vim \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install CLI tools
COPY --from=deno /deno /usr/local/bin/deno
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/kubectl

# Use fish for default
RUN chsh -s /usr/bin/fish
RUN fish -c "curl -sL https://git.io/fisher | source ; fisher install jorgebucaran/fisher"

# apg-get install bat to batcat
## see: https://github.com/sharkdp/bat/issues/1186
RUN ln -s /usr/bin/batcat /usr/bin/bat

# apg-get install fdfind to fd
RUN ln -s /usr/bin/fdfind /usr/bin/fd

RUN groupadd -r knife --gid 1000 && useradd --no-log-init -r -m -g knife knife --uid 1000
RUN mkdir /workspace && chown -R knife:knife /workspace

# knife user
USER 1000

WORKDIR /workspace

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/fish"]