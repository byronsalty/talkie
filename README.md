# Talkie

A project to experience with clustering locally and hosted on Fly.io


This is a companion project for [this article](https://dev.to/byronsalty/clustering-with-phoenix-17-25o4).

# Run cluster locally

```
PORT=5000 elixir --name a@127.0.0.1 -S mix phx.server
PORT=5001 elixir --name b@127.0.0.1 -S mix phx.server
```
