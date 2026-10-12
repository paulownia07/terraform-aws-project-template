FROM mcr.microsoft.com/devcontainers/base:ubuntu26.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl gnupg unzip \
    && install -m 0755 -d /etc/apt/keyrings \
    && curl -fsSL https://apt.releases.hashicorp.com/gpg \
        | gpg --dearmor -o /etc/apt/keyrings/hashicorp-archive-keyring.gpg \
    && chmod a+r /etc/apt/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(. /etc/os-release && echo "$VERSION_CODENAME") main" \
        > /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends terraform \
    && case "$(dpkg --print-architecture)" in \
        amd64) aws_arch=x86_64 ;; \
        arm64) aws_arch=aarch64 ;; \
        *) echo "Unsupported architecture for AWS CLI" >&2; exit 1 ;; \
    esac \
    && curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-${aws_arch}.zip" -o /tmp/awscliv2.zip \
    && unzip -q /tmp/awscliv2.zip -d /tmp \
    && /tmp/aws/install \
    && rm -rf /tmp/aws /tmp/awscliv2.zip \
    && apt-get purge -y --auto-remove curl gnupg unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspaces

USER vscode