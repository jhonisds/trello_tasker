# TrelloTasker

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix

## Commands

- mix phx.new trello_tasker --live
- Install gigalixir: brew tap gigalixir/brew && brew install gigalixir
- $ gigalixir login
- $ gigalixir apps
- $ git remote add gigalixir
- $ git push gigalixir main
- $ npm install --prefix ./assets
- $ mix ecto.setup
- create database: gigalixir pg:create --free
- $ iex -S mix phx.server
- $ source .env
- $ mix phx.gen.context Cards Card cards path
- $ mix ecto.migrate
- gigalixir config:set TRELLO_KEY="xxxxxx"/TRELLO_TOKEN="xxxx"
- gerar chave: `ssh-keygen -t rsa`
- $ cat `/Users/jhoni/.ssh/id_rsa.pub`
- $ gigalixir account:ssh_keys:add "$(cat /Users/jhoni/.ssh/id_rsa.pub)"
- $ gigalixir account:ssh_keys
- $ gigalixir ps:migrate
