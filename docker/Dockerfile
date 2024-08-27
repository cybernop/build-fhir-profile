ARG OS_BASE

FROM alpine:3.20 AS base-alpine

RUN apk add --update \
    bash \
    icu-libs \
    npm

# Installieren der notwendige Tools
# Add Microsoft's .NET SDK repository and install .NET SDK
RUN wget https://dot.net/v1/dotnet-install.sh \
    && chmod +x dotnet-install.sh \
    && ./dotnet-install.sh --channel 8.0 --install-dir /usr/share/dotnet \
    && ln -s /usr/share/dotnet/dotnet /usr/local/bin \
    && rm dotnet-install.sh

# Install the Firely Terminal
RUN dotnet tool install Firely.Terminal --tool-path /usr/local/bin

# Workaround for permissions issues for dotnet tools
RUN chmod -R 777 /root
ENV HOME=/root

# ENV DOTNET_ROOT=/usr/lib/dotnet
# ENV PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

# RUN apt update \
#     && apt install -y \
#     curl \
#     wget \
#     # .NET dependencies
#     libicu74

# # Install .NET SDK
# RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh \
#     && chmod +x ./dotnet-install.sh \
#     && ./dotnet-install.sh --channel ${DOTNET_VERSION} \
#     && rm ./dotnet-install.sh

# ENV DOTNET_ROOT=/root/.dotnet
# ENV PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

# # Install NodeJS via NVM
# ENV NVM_DIR=/root/.nvm
# RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash \
#     && . $NVM_DIR/nvm.sh \
#     && nvm install $NODE_VERSION

# ENV NODE_PATH=$NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
# ENV PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# RUN apt update \
#     && apt install -y software-properties-common \
#     && add-apt-repository ppa:dotnet/backports \
#     && apt remove -y software-properties-common

FROM ubuntu:24.04 AS base-ubuntu

ARG NODE_VERSION=20.16.0
ARG DOTNET_VERSION=6.0

RUN apt update \
    && apt install -y \
    dotnet-sdk-8.0 \
    npm

# Install the Firely Terminal
RUN dotnet tool install --global Firely.Terminal
ENV PATH="$PATH:/root/.dotnet/tools"


FROM ghcr.io/cybernop/build-fhir-profiles:base-$OS_BASE

ARG SUSHI_VERSION

# Install FSH sushi
RUN npm install --global fsh-sushi@$SUSHI_VERSION

COPY entrypoint.sh /root/entrypoint.sh
RUN chmod a+rx /root && chmod a+x /root/entrypoint.sh

ENV PROJECT_DIR=/project
ENV SUSHI_ROOT=.

ENTRYPOINT [ "sh", "/root/entrypoint.sh" ]
