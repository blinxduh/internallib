## How to use

Step 1. Init the library.
```lua
local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/blinxduh/internallib/main/GuiLibrary.lua', true))()
```

Step 2. Init the ScreenGui.
```lua
local screengui = library.init()
```

Step 3. Render a panel
```lua
local panel = screengui.drawPanel("Panel!")
```

Step 4. Creating modules.
```lua
local mod = panel.addModule("Module",
    function()
      -- On Enable    
    end,
    function()
      -- On Disable
    end
)
```

Step 5. Creating settings

Internal Library only has two settings at the moment. Boolean and Mode

```lua
local testBool = mod.newBoolean("Test Bool", false) -- False means it's disabled when rendered / created
local testMode = mod.newMode("Test Modes", {"Mode 1", "Mode 2", "Mode 3", "Mode 4"})
```

## Misc

We can check is settings are true or false, or a certain value.
We can do it by doing this.

```lua
if testBool.isEnabled() then 
    print("test boolean is enabled!")
else
    print("test boolean is disabled")
end
```

And for modes.

```lua
if testMode.getMode() == "Mode 1" then 
    print("Mode is Mode 1")
end
```
