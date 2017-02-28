FROM ruby:2.3

RUN apt-get update -q && \
  apt-get install -y --no-install-recommends less sqlite3 libsqlite3-dev nodejs

RUN useradd --create-home --user-group --uid 1000 app && \
  mkdir /app && \
  chown app /app

USER app

WORKDIR /app

ENV LANG=C.UTF-8 \
  LC_ALL=C.UTF-8 \
  BUNDLE_JOBS=4

CMD ["sh", "-c", "trap : TERM INT; sleep infinity & wait"]
