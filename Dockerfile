FROM golang:1.15

COPY LICENSE README.md /
COPY src/ /
RUN /install.sh

RUN apt-get update -qq \
  && apt-get install -y git \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/entrypoint.sh"]
