FROM ruby:2.4

RUN apt-get update -q && \
  apt-get install -y --no-install-recommends less sqlite3 libsqlite3-dev

ENV LANG=C.UTF-8 \
  LC_ALL=C.UTF-8

CMD ["sh", "-c", "trap : TERM INT; sleep infinity & wait"]
