FROM elixir:1.11.2-alpine

RUN mix local.hex --force
RUN mix archive.install hex phx_new

RUN apk add bash curl

#RUN touch ~/.profile
#RUN cd ~ && pwd
#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.1/install.sh | bash
#RUN export NVM_DIR="$HOME/.nvm" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#RUN nvm install 14.15.1
#RUN npm i -g npm
