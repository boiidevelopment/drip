<img width="1282" height="752" alt="image" src="https://github.com/user-attachments/assets/652c4c31-a9f7-4f7e-ac13-4d252148e619" />

# DRIP - Drawn Interface Pack

A lightweight collection of standalone UI components for FiveM.
Each component is a single file with no dependencies - use one, some, or all of them.

## Components

| File | Description |
|---|---|
| `notify.lua` | Queued notification toasts |
| `input.lua` | Multi-field data entry panel |
| `menu.lua` | Infinite depth submenu system |
| `panel.lua` | KVP text panel, multiple instances |

All components share the same patterns - identical helpers, `style = {}` overrides, and consistent API structure.

---

## How to Use DRIP

### Option A - Standalone Resource

Drop the `drip` folder into your resources, `ensure drip` in `server.cfg`, then call via exports from any resource:

```lua
exports.drip:send_notification({header = "Info", type = "info", message = "Hello.", duration = 3000})
exports.drip:open_menu({id = "main", root = "menu_1", menus = {...}})
exports.drip:show_panel({id = "hud", title = "Status", lines = {...}})
exports.drip:open_input({title = "Give Item", inputs = {...}})
```

---

### Option B - Embedded Library

Copy the `drip/components/` folder into your resource, for example into a `libs/drip/` folder, then add to your `fxmanifest.lua`:

```lua
client_scripts {
    "libs/drip/*.lua"
}
```

Functions are then available directly in your resource scope via the `drip` namespace:

```lua
drip.send_notification({header = "Info", type = "info", message = "Hello.", duration = 3000})
drip.open_menu({id = "main", root = "menu_1", menus = {...}})
drip.show_panel({id = "hud", title = "Status", lines = {...}})
drip.open_input({title = "Give Item", inputs = {...}})
```

---

### Option C - Single File

Take only the component you need, drop it into your resource, and call the functions directly:

```lua
-- fxmanifest.lua
client_scripts {
    "notify.lua",
    "my_script.lua"
}
```

```lua
-- my_script.lua
send_notification({header = "Success", type = "success", message = "Done.", duration = 3000})
```

No extra setup. No dependencies. It just works.

---

## Quick Install

1. Download the latest release from [Releases](https://github.com/boiidevelopment/drip/releases/)
2. Drop the `drip` folder into your `resources` directory.
3. Add `ensure drip` to `server.cfg` 
4. Start `refresh; ensure drip` or Restart server

## Notes

This resource uses Draw functions entirely to create UI elements.
Do not cry about the client side ms.
This is not intended to be used as full forward facing, more for debug/dev use.

---

## Support

Need help? Found a bug? Got feedback?

👉 [Discord](https://discord.gg/MUckUyS5Kq)

**Support Hours:** Mon–Fri, 10AM–10PM GMT
Outside those hours? Leave a message. I'll get to it when I'm back.
