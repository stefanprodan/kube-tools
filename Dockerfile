FROM golang:1.15

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        gettext-base git-crypt

COPY LICENSE README.md /
COPY src/ /
RUN /install.sh

ENTRYPOINT ["/entrypoint.sh"]
