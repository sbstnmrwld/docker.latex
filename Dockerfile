FROM alpine:3.13@sha256:a75afd8b57e7f34e4dad8d65e2c7ba2e1975c795ce1ee22fa34f8cf46f96a3be

LABEL maintainer="seb@meerw.de" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.name="sbstnmrwld/latex" \
    org.label-schema.description="Latex inside Docker" \
    org.label-schema.url="https://github.com/sbstnmrwld/docker.latex" \
    org.label-schema.vcs-url="https://github.com/sbstnmrwld/docker.latex" \
    org.label-schema.vendor="sbstnmrwld"

RUN apk --no-cache add texlive && \
    rm -rf /var/cache/apk/*
