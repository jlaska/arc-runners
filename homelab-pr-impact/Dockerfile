FROM ghcr.io/actions/actions-runner:2.337.0

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install gh CLI via official apt repo
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
      | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
      > /etc/apt/sources.list.d/github-cli.list \
    && apt-get update && apt-get install -y gh \
    && rm -rf /var/lib/apt/lists/*

# renovate: datasource=github-releases depName=helm/helm
ENV HELM_VERSION=v3.17.3
RUN curl -fsSL "https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz" \
    | tar -xz --strip-components=1 -C /usr/local/bin linux-amd64/helm

# renovate: datasource=github-releases depName=google/go-containerregistry
ENV CRANE_VERSION=v0.20.3
RUN curl -fsSL "https://github.com/google/go-containerregistry/releases/download/${CRANE_VERSION}/go-containerregistry_Linux_x86_64.tar.gz" \
    | tar -xz -C /usr/local/bin crane

# renovate: datasource=github-releases depName=astral-sh/uv
ENV UV_VERSION=0.7.14
RUN curl -fsSL "https://github.com/astral-sh/uv/releases/download/${UV_VERSION}/uv-x86_64-unknown-linux-gnu.tar.gz" \
    | tar -xz --strip-components=1 -C /usr/local/bin \
        uv-x86_64-unknown-linux-gnu/uv \
        uv-x86_64-unknown-linux-gnu/uvx

# renovate: datasource=github-releases depName=kubernetes/kubernetes
ENV KUBECTL_VERSION=v1.36.3
RUN curl -fsSL "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

# Node.js (required for Claude Code CLI)
# renovate: datasource=node-version depName=node
ENV NODE_VERSION=24.19.0
RUN curl -fsSL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" \
    | tar -xz --strip-components=1 -C /usr/local

# Claude Code CLI
# renovate: datasource=npm depName=@anthropic-ai/claude-code
ENV CLAUDE_CODE_VERSION=2.1.232
RUN npm install -g --foreground-scripts "@anthropic-ai/claude-code@${CLAUDE_CODE_VERSION}" \
    && claude --version

USER runner
