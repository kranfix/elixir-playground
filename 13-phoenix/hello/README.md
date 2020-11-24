# Hello

## Installing Phoenix (for first time)

```
# Install hex if necessary
mix local.hex

# Install phx
mix archive.install hex phx_new
mix archive.install hex phx_new [version]
```

For example:

```
mix archive.install hex phx_new 1.5.6
```

## Creating a Phonix project

Go to the directory where you want to create the project

```
cd /you/project/directory/parent/
```

Create a project:

```
mix phx.new <project-name>
```

For example

```
mix phx.new hello
```

if you don't want to use webpack (with Node.js) neither ecto (for Db):

```
# Without ecto, but webpack
mix phx.new <project-name> --no-ecto

# Without webpack, but ecto
mix phx.new <project-name> --no-webpack

# Without both
mix phx.new <project-name> --no-ecto --no-webpack
```

###

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Installing Docker

## Installing Postgres with docker

Install postgres:

```
docker pull postgres
```

Create a `pg` directory in your local path:

```
mkdir pg
```

Do not forget to ignore this folder in the `.gitignore` file.

Creating container `my-postgres`.

- --name : name of the container
- -d : deamon/background
- -p : map ports `computer-port:inner-container-port`
- -e : enviroment variable
- -v : volume or directory
- image-name[:image-tag]

```
docker run
  --name my-postgres
  [-e POSTGRES_USER=postgres]
  -e POSTGRES_PASSWORD=pgsecret
  -e PGDATA=/PGDATA
  -v $PWD/pg:/PGDATA
  -p 5432:5432
  -d
  postgres[:latest]
```

```
docker run --name my-postgres -e POSTGRES_PASSWORD=pgsecret -e PGDATA=/PGDATA -v $PWD/pg:/PGDATA -p 5432:5432 -d postgres
```

And verify the connection with `telnet localhost 5432`.

Create a project with Phoenix

```
mix phx.new hello
```

Create DB (postgress by default)

```
mix ecto.create
```

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
