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

ENV PATH="/usr/local/texlive/2020/bin/x86_64-linuxmusl:${PATH}"

RUN apk add --no-cache --virtual .build-deps curl fontconfig-dev freetype-dev xz tar wget && \
    apk add --no-cache perl && \
    mkdir -p /tmp/install-tl-unx && \
    curl -L https://ftp.rrze.uni-erlangen.de/ctan/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -xz -C /tmp/install-tl-unx --strip-components=1 && \
    printf "%s\n" \
        "selected_scheme scheme-basic" \ 
        "tlpdbopt_install_docfiles 0" \ 
        "tlpdbopt_install_srcfiles 0" \
        "tlpdbopt_autobackup 0" \ 
        "tlpdbopt_sys_bin /usr/bin" \
        > /tmp/install-tl-unx/install.profile && \
    /tmp/install-tl-unx/install-tl --profile=/tmp/install-tl-unx/install.profile && \
    tlmgr install \
    #   collection-latexextra \
    #   collection-fontsrecommended \
      latexmk && \
    rm -fr /tmp/install-tl-unx && \
    apk del .build-deps
