FROM golang:1.15

COPY LICENSE README.md /
COPY src/ /
RUN /install.sh

RUN apt-get update -qq \
  && apt-get install -y git \
  && rm -rf /var/lib/apt/lists/*

RUN curl -s -L https://github.com/fsaintjacques/semver-tool/archive/3.0.0.tar.gz | tar -xz -C /usr/local/ \
  && mv /usr/local/semver-tool-3.0.0/src/semver /usr/local/bin/semver \
  && rm -rf /usr/local/semver-tool-3.0.0 \
  && chmod a+x /usr/local/bin/semver

ENTRYPOINT ["/entrypoint.sh"]
