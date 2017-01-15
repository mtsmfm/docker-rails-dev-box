# Docker rails dev box

## Usage

```
git clone https://github.com/rails/rails
cd rails
curl -sL https://github.com/mtsmfm/docker-rails-dev-box/raw/master/setup | bash
```

## Run linter on Atom editor (linter-ruby/linter-rubocop)

Add `docker/bin` to `$PATH`:

```
PATH=$PWD/docker/bin:$PATH atom .
```
