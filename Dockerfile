ARG RUBY_IMAGE

FROM $RUBY_IMAGE

ARG HOST_UID
ARG RUBY_IMAGE

RUN test -n "${HOST_UID}" || (echo 'Please build with HOST_UID build arg! eg. `docker-compose build --build-arg HOST_UID=$UID ruby`' && false)

RUN apt-get update -q && \
  apt-get install -y less sqlite3 libsqlite3-dev nodejs redir build-essential patch ruby-dev zlib1g-dev liblzma-dev poppler-utils mupdf-tools ffmpeg

RUN useradd --create-home --user-group --uid $HOST_UID app && \
  mkdir /app /vendor && \
  chown -R app /app /vendor

ENV LANG=C.UTF-8 \
  LC_ALL=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_PATH=/vendor/bundle

ENV ENTRYKIT_VERSION 0.4.0

RUN wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && mv entrykit /bin/entrykit \
  && chmod +x /bin/entrykit \
  && entrykit --symlink

COPY docker /docker

USER app

WORKDIR /app

ENTRYPOINT ["prehook", "/docker/prehook", "--"]
