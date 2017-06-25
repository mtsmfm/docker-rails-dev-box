FROM ruby:2.4.1

RUN apt-get update -q && \
  apt-get install -y --no-install-recommends less sqlite3 libsqlite3-dev nodejs

RUN useradd --create-home --user-group --uid 1000 app && \
  mkdir -p /app/vendor/bundle && \
  chown -R app /app

USER app

WORKDIR /app

ENV LANG=C.UTF-8 \
  LC_ALL=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_PATH=/app/vendor/bundle

CMD ["sh", "-c", "trap : TERM INT; sleep infinity & wait"]
