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
ENV DOTNET_CLI_TELEMETRY_OPTOUT="1"

# Workaround for permissions issues for dotnet tools
RUN chmod -R 777 /root
ENV HOME=/root


FROM ubuntu:24.04 AS base-ubuntu

ARG NODE_VERSION=20.16.0

RUN apt update \
    && apt install -y \
    wget

RUN wget https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh \
    && chmod +x nodesource_setup.sh \
    && ./nodesource_setup.sh \
    && rm nodesource_setup.sh

RUN apt update && install -y nodejs

# Installieren der notwendige Tools
# Add Microsoft's .NET SDK repository and install .NET SDK
RUN wget https://dot.net/v1/dotnet-install.sh \
    && chmod +x dotnet-install.sh \
    && ./dotnet-install.sh --channel 8.0 --install-dir /usr/share/dotnet \
    && ln -s /usr/share/dotnet/dotnet /usr/local/bin \
    && rm dotnet-install.sh

# Install the Firely Terminal
RUN dotnet tool install --global Firely.Terminal
ENV PATH="$PATH:/root/.dotnet/tools"
ENV DOTNET_CLI_TELEMETRY_OPTOUT="1"


FROM base-${OS_BASE}

ARG SUSHI_VERSION

# Install FSH sushi
RUN npm install --global fsh-sushi@$SUSHI_VERSION

COPY entrypoint.sh /root/entrypoint.sh
RUN chmod a+rx /root && chmod a+x /root/entrypoint.sh

ENV PROJECT_DIR=/project
ENV SUSHI_ROOT=.

ENTRYPOINT [ "sh", "/root/entrypoint.sh" ]
