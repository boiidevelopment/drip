# input

Data-driven multi-field input panel. Centred on screen by default. Confirms or cancels via callback.

---

## API

| Function | Description |
|---|---|
| `open_input(data)` | Open the input panel |
| `close_input()` | Close the input panel |
| `is_input_open()` | Returns `true` if open |

### Exports
```lua
exports["resource_name"]:open_input(data)
exports["resource_name"]:close_input()
exports["resource_name"]:is_input_open()
```

---

## Parameters

| Key | Type | Description |
|---|---|---|
| `title` | string | Header text |
| `inputs` | table | Array of field definitions |
| `on_confirm` | function | Called with `values` table on confirm |
| `on_cancel` | function | Called on cancel or escape |
| `style` | table | Style overrides (see below) |

### `style` overrides

| Key | Type | Default |
|---|---|---|
| `x` | number | `nil` (centred) |
| `y` | number | `nil` (centred) |
| `width` | number | `0.22` |
| `val_w` | number | `0.07` |
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
| `header_text` | `{255, 255, 255, 255}` |
| `text` | `{220, 220, 220, 220}` |
| `text_sel` | `{255, 255, 255, 255}` |
| `highlight` | `{255, 255, 255, 30}` |
| `accent` | `{228, 173, 41, 255}` |
| `val_bg` | `{60, 60, 60, 200}` |
| `val_fill` | `{228, 173, 41, 180}` |

---

## Field Types

### `select`
Cycle through a list of options with left/right arrows.

| Key | Type | Description |
|---|---|---|
| `id` | string | Key in returned values table |
| `type` | string | `"select"` |
| `label` | string | Display label |
| `options` | table | Array of strings or `{label, value}` tables |
| `default_index` | number | Starting option index (default `1`) |

### `number`
Increment/decrement a number with left/right arrows, displayed as a fill bar.

| Key | Type | Description |
|---|---|---|
| `id` | string | Key in returned values table |
| `type` | string | `"number"` |
| `label` | string | Display label |
| `min` | number | Minimum value |
| `max` | number | Maximum value |
| `step` | number | Increment amount |
| `default` | number | Starting value |

---

## Example

```lua
open_input({
    title = "Give Item",
    style = {width = 0.22},
    inputs = {
        {
            id = "item_id",
            type = "select",
            label = "Item",
            options = {
                {label = "Water", value = "water"},
                {label = "Burger", value = "burger"},
                {label = "Bandage", value = "bandage"},
            }
        },
        {id = "amount", type = "number", label = "Amount", min = 1, max = 100, step = 1, default = 1},
        {id = "quality", type = "number", label = "Quality", min = 0, max = 100, step = 5, default = 100},
    },
    on_confirm = function(values)
        print(values.item_id, values.amount, values.quality)
    end,
    on_cancel = function()
        print("cancelled")
    end
})
```

---

## Controls

| Key | Action |
|---|---|
| `↑ / ↓` | Navigate fields |
| `← / →` | Change value |
| `Enter` | Confirm / activate action |
| `Escape` | Cancel |