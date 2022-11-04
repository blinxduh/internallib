## Internal UI Library.

This is a small project I've been working on for a while now, this UI library is basically just for my scripts but i decided to release to the public. It isn't supposed to be professional or advanced, it's just a ui library I use for testing script, etc.

I'll give a documentation on how to use it.

## Initiate the library.
```lua
local engine = loadstring(game:HttpGet('https://gitlab.com/internallibrary/main/-/raw/main/library.lua',true))()
```

## Initiate the ScreenGui.
```lua
local gui = engine.init()
```
## Creating panels.
```lua
local panel = gui.drawPanel("Hello!!")
```
## Creating folders.
```lua
local folder = panel.addFolder("Folder")
```
To open a folder, just right click with your mouse c:
## Creating booleans.
```lua
local bool = folder.newBooleanSetting("Boolean!", true) -- Set the default state to true or false.
```
A boolean setting has getters.
You can get it's state by doing this.
```lua
if bool.isEnabled() then 
    print("Boolean is enabled!")
else
    print("Boolean is disabled!")
end
```
## Creating modes.
```lua
local mode = folder.newModeSetting("Modes", {"Mode 1", "Mode 2", "Mode 3"})
```
Like boolean settings, mode settings has a getter.
You can get the current mode by doing this.
```lua
if mode.getMode() == "Mode 1" then 
    print("Mode is 'Mode 1'")
end
```
## Creating number settings.
```lua
local number = folder.newNumberSetting("Number", {
    Value = 10, -- Defaults to 10
    Min = 0, -- Defaults to 0
    Max = 100, -- Defaults to 100
    Step = 1 -- Defaults to 1
})
```
The number setting it controlled by buttons;
Increase and Decrease.

You can also get the current value of the number!
By doing this.
```lua
if number.getValue() == 20 then 
    print("Value is 20!")
end
```

## Conclusion.
This is the end but I might add more features soon.
