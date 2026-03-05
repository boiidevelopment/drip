# menu

Data-driven menu system. Supports infinite depth submenus, multiple simultaneous instances with tab switching, and per-instance style overrides.

---

## API

| Function | Description |
|---|---|
| `open_menu(data)` | Open a menu instance |
| `close_menu(id?)` | Close by id, or close all if no id passed |
| `is_menu_open(id?)` | Returns `true` if instance is open, or any menu if no id passed |
| `update_menu(id, menu_key, data)` | Update a single menu's items within an existing instance by key |
| `update_menus(id, menus)` | Batch update multiple menus within an existing instance, preserving cursor position |

---

## Parameters

| Key | Type | Description |
|---|---|---|
| `id` | string | Unique instance identifier |
| `root` | string | Key of the starting menu |
| `menus` | table | Keyed table of menu definitions |
| `style` | table | Style overrides (see below) |

### `style` overrides

| Key | Type | Default |
|---|---|---|
| `x` | number | `0.015` |
| `y` | number | `0.0275` |
| `width` | number | `0.22` |
| `max_vis` | number | `10` |
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
| `text_dim` | `{160, 160, 160, 200}` |
| `highlight` | `{255, 255, 255, 30}` |
| `accent` | `{228, 173, 41, 255}` |
| `toggle_on` | `{80, 200, 120, 255}` |
| `toggle_off` | `{200, 80, 80, 255}` |
| `slider_bg` | `{60, 60, 60, 200}` |
| `separator` | `{255, 255, 255, 30}` |

---

## Item Types

| Type | Description |
|---|---|
| `action` | Triggers `on_action()`, closes menu unless `keep_open = true` |
| `toggle` | Flips `value` bool, triggers `on_change(value)` |
| `slider` | Adjusts number value with left/right, triggers `on_change(value)` |
| `submenu` | Navigates to another menu via `submenu` key |
| `back` | Navigates to menu via `key`, or closes if no key |
| `close` | Closes the instance |
| `separator` | Visual divider, optional `label` |

---

## Example

```lua
open_menu({
    id = "main",
    root = "menu_1",
    style = {x = 0.015, y = 0.0275, width = 0.22},
    menus = {
        menu_1 = {
            title = "Main Menu",
            items = {
                {
                    type = "action",
                    label = "Do Something",
                    desc = "Triggers a function.",
                    on_action = function() print("action triggered") end
                },
                {
                    type = "toggle",
                    label = "Toggle Option",
                    value = false,
                    on_change = function(v) print("toggled", v) end
                },
                {
                    type = "slider",
                    label = "Slider",
                    min = 0, max = 100, value = 50, step = 5,
                    on_change = function(v) print("slider", v) end
                },
                {type = "submenu", label = "Submenu", submenu = "menu_2"},
                {type = "separator"},
                {type = "close", label = "Close"},
            }
        },
        menu_2 = {
            title = "Submenu",
            items = {
                {type = "back", key = "menu_1", label = "Back"},
            }
        },
    }
})
```

---

## Controls

| Key | Action |
|---|---|
| `Up / Down` | Navigate items |
| `Left / Right` | Adjust slider |
| `Enter` | Activate item |
| `Backspace` | Back / close |
| `Tab` | Switch focus between open instances |