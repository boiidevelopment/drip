# notify

Queued notification component. Supports four types, optional style overrides, and per-notification colour customisation.

---

## API

### `notify(data)`
Push a notification onto the queue.

### `exports["resource_name"]:notify(data)`
Call from another resource.

### Net Event
```lua
TriggerClientEvent("resource_name:notify", source, data)
```

---

## Parameters

| Key | Type | Default | Description |
|---|---|---|---|
| `header` | string | `"Notice"` | Header text |
| `type` | string | `"info"` | `"success"`, `"error"`, `"info"`, `"warning"` |
| `message` | string | `""` | Body text, auto word-wrapped |
| `duration` | number | `3000` | Display time in ms |
| `style` | table | `{}` | Style overrides (see below) |

### `style` overrides

| Key | Type | Default |
|---|---|---|
| `x` | number | `0.785` |
| `width` | number | `0.20` |
| `wrap` | number | `40` |
| `header_font` | number | `4` |
| `header_scale` | number | `0.34` |
| `header_height` | number | `0.030` |
| `text_font` | number | `0` |
| `text_scale` | number | `0.30` |
| `line_h` | number | `0.024` |
| `pad_x` | number | `0.008` |
| `pad_y` | number | `0.006` |
| `colours` | table | See below |

### `style.colours` overrides

| Key | Default |
|---|---|
| `bg` | `{0, 0, 0, 180}` |
| `bg_inner` | `{255, 255, 255, 15}` |
| `header` | `{20, 20, 20, 255}` |
| `text` | `{220, 220, 220, 220}` |
| `success` | `{80, 200, 120, 255}` |
| `error` | `{200, 80, 80, 255}` |
| `info` | `{80, 160, 255, 255}` |
| `warning` | `{228, 173, 41, 255}` |

---

## Examples

**Basic**
```lua
notify({
    header = "Success",
    type = "success",
    message = "Player has been healed.",
    duration = 5000
})
```

**With style overrides**
```lua
notify({
    header = "Warning",
    type = "warning",
    message = "Low server performance detected.",
    duration = 8000,
    style = {
        x = 0.5,
        width = 0.30,
        colours = {
            warning = {255, 100, 0, 255}
        }
    }
})
```

**From server**
```lua
TriggerClientEvent("resource_name:notify", source, {
    header = "Info",
    type = "info",
    message = "Server restart in 10 minutes.",
    duration = 10000
})
```

**From another resource**
```lua
exports["resource_name"]:notify({
    header = "Error",
    type = "error",
    message = "Something went wrong.",
    duration = 5000
})
```