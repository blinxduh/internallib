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
