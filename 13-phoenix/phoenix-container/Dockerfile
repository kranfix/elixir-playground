FROM elixir:1.11.2-alpine

RUN mix local.hex --force
RUN mix archive.install hex phx_new

RUN apk add bash
RUN apk add nodejs
