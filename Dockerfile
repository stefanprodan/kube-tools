FROM alpine:3.10 as build

RUN apk --no-cache add curl

COPY src/install.sh /

RUN /install.sh

# use busybox for a smaller, simple, entrypoint for scripting
FROM busybox:1.31

COPY --from=build /usr/local/bin /usr/local/bin

ENV PATH "/usr/local/bin"

CMD /bin/sh