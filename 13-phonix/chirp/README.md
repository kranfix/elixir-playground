# Chirp

Create a project with LiveView

```
mix phx.new chirp --live
```

Create a new LiveView component

```
mix phx.gen.live Timeline Post posts username body like_count:integer reports_count:integer
```

Where:

- POST: resource to persist
