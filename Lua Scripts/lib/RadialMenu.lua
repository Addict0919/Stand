--[[--------------------------------
RADIAL MENU LIBRARY FOR STAND (DEMO)
BY NOWIRY
V2.0.0
-----------------------------------]]

util.require_natives(1651208000)

if not filesystem.exists(filesystem.scripts_dir() .. "lib/natives-1651208000.lua") then
	error("required file not found: lib/natives-1651208000.lua")
end

if filesystem.exists(filesystem.resources_dir() .. "RadialMenu.ytd") then
    -- stores default textures
	util.register_file(filesystem.resources_dir() .. "RadialMenu.ytd")
else
    error("required file not found: resources/RadialMenu.ytd")
end

-- DEBUG
local function drawDebugText(...)
	local arg = {...}
	local strg = ""
	for _, w in ipairs(arg) do
		strg = strg .. tostring(w) .. '\n'
	end
	local colour = {r = 1.0, g = 0.0, b = 0.0, a = 1.0}
	directx.draw_text(0.05, 0.05, strg, ALIGN_TOP_LEFT, 1.0, colour, false)
end

--------------------------------
-- VECTOR
--------------------------------

---@class Vector2
---@field x number
---@field y number
local Vector2 = {x = 0, y = 0}
Vector2.__index = Vector2

---Returns a new `Vector2` instance.
---@param x? number
---@param y? number
---@return Vector2
---@nodiscard
function Vector2.new(x, y)
    local instance = setmetatable({}, Vector2)
    instance.x = x
    instance.y = y
    return instance
end

---@param o table
---@return boolean
function Vector2.isInstance(o)
    return getmetatable(o) == Vector2
end

---@param a Vector2
---@param b Vector2
---@return Vector2
Vector2.__add = function (a,b)
    return Vector2.new(a.x + b.x, a.y + b.y)
end

---@param a Vector2
---@param b Vector2
---@return Vector2
Vector2.__sub = function (a,b)
    return Vector2.new(a.x - b.x, a.y - b.y)
end

---@param a Vector2
---@return Vector2
Vector2.__unm = function (a)
	return Vector2.new(-a.x, -a.y)
end

---@param a Vector2
---@param b number
---@return Vector2
Vector2.__mul = function (a,b)
    if type(a) == "number" and type(b) == "table" then
        return Vector2.new(b.x * a, b.y * a)
    end
    if type(a) == "table" and type(b) == "number" then
        return Vector2.new(a.x * b, a.y * b)
    end
end

---@param a Vector2
---@return number
Vector2.__len = function (a)
	return math.sqrt(a.x^2 + a.y^2)
end

---@param a Vector2
---@return string
function Vector2.__tostring(a)
	return string.format("{x: %.3f, y: %.3f}", a.x, a.y)
end

---@param a Vector2
---@return number
function Vector2:dot(a)
    return self.x * a.x + self.y * a.y
end

--------------------------------
-- COLOUR
--------------------------------

---@class RGBA
local RGBA = {r = 0, g = 0, b = 0, a = 255}
RGBA.__index = RGBA

---Returns a new `RGBA` instance.
---Is a table with `r`, `g`, `b` and `a` with values between `0` and `255`.
---@param r? integer
---@param g? integer
---@param b? integer
---@param a? integer
---@return RGBA
---@nodiscard
function RGBA.new(r, g, b, a)
    local instance = setmetatable({}, RGBA)
    instance.r = r
    instance.g = g
    instance.b = b
    instance.a = a
    return instance
end

---@param o table
---@return boolean
function RGBA.isInstance(o)
    return getmetatable(o) == RGBA
end

---Returns an `RGBA` instance from a table with values
---between `0.0` and `1.0`.
---@param t table
---@return RGBA
---@nodiscard
function RGBA.fromTable(t)
    local instance = setmetatable({}, RGBA)
    for key, value in pairs(t) do
        if not instance[ key ] then
            goto continue
        end
        if type(value) ~= "number" then
            error("got an invalid colour. " .. string.format('"%s"', key) .. " must be a number, got " .. type(value))
        elseif value < 0.0 or value > 1.0 then
            error("got an invalid colour. " .. string.format('"%s"', key) .. " must a number between 0.0 and 1.0")
        end
        instance[ key ] = math.ceil(value * 255)
        ::continue::
    end
    return instance
end

---Returns a table with `r`, `g`, `b` and `a` with values between `0.0` and `1.0`.
---@return table
---@nodiscard
function RGBA:getTable()
    local t = {}
    t.r = self.r / 255
    t.g = self.g / 255
    t.b = self.b / 255
    t.a = self.a / 255
    return t
end

--------------------------------
-- SPRITE
--------------------------------

---@class Sprite
---@field dict string
---@field name string
Sprite = {dict = "", name = ""}
Sprite.__index = Sprite

---Returns a new `Sprite` instance.
---@param dict string
---@param name string
---@return Sprite
---@nodiscard
function Sprite.new(dict, name)
    local instance = setmetatable({}, Sprite)
    assert(type(dict) == "string", "dict must be a string, got " .. type(dict))
    instance.dict = dict
    assert(type(name) == "string", "name must be a string, got " .. type(name))
    instance.name = name
    return instance
end

---@param o table
---@return boolean
function Sprite.isInstance(o)
    return getmetatable(o) == Sprite
end

---Draws the sprite on the given screen position.
---1) Requires `colour` to be a `RGBA` instance.
---2) There's no need to request the texture dict before drawing.
---@param screenX number
---@param screenY number
---@param width number
---@param height number
---@param heading number
---@param colour? RGBA
function Sprite:draw(screenX, screenY, width, height, heading, colour)
    if GRAPHICS.HAS_STREAMED_TEXTURE_DICT_LOADED(self.dict)  then
        colour = colour or RGBA.new(255, 255, 255, 255)
        assert(RGBA.isInstance(colour), "colour must be a RGBA instance or nil")
        GRAPHICS.DRAW_SPRITE(self.dict, self.name, screenX, screenY, width, height, heading, colour.r, colour.g, colour.b, colour.a, true)
    else
        GRAPHICS.REQUEST_STREAMED_TEXTURE_DICT(self.dict, 0)
    end
end

--------------------------------
-- EASING
--------------------------------

local function easeOutElastic(x)
    if x <= 0 then
        return 0
    elseif x >= 1 then
        return 1
    else
        local c = 2 * math.pi / 3
        return 2^(-10 * x) * math.sin((x * 10 - 0.75) * c) + 1
    end
end

local function easeInBack(x)
    if x <= 0 then
        return 0
    elseif x >= 1 then
        return 1
    else
        local c1 = 0.9
        local c2 = c1 + 1
        return c2 * x^3 - c1 * x
    end
end

local function easeOutCirc(x)
    if x <= 0 then
        return 0
    elseif x >= 1 then
        return 1
    else
        return math.sqrt(1 - (x - 1)^2)
    end
end

local function easeInCirc(x)
    if x <= 0 then
        return 0
    elseif x >= 1 then
        return 1
    else
        return 1 - math.sqrt(1 - x^2)
    end
end

---@class Easing
---@field startTime integer
---@field duration integer
---@field time integer
---@field easeFunc function
local Easing = {startTime = 0, duration = 0, time = 0, easeFunc = function (perc) end}
Easing.__index = Easing

---Returns a new `Easing` instance.
---`duration` is in `ms`.
---@param duration integer
---@param easeFunction function
---@return Easing
---@nodiscard
function Easing.new(duration, easeFunction)
    local instance = setmetatable({}, Easing)
    instance.duration = duration -- ms
    instance.easeFunc = easeFunction
    return instance
end

---Resturns the current `x` component of the ease function. Goes from `0.0` to `1.0`.
---@return number
---@nodiscard
function Easing:getProgress()
    if self.startTime == 0 then
        self.startTime = util.current_time_millis()
    end
    local progress = self.easeFunc(self.time / self.duration)
    self.time = util.current_time_millis() - self.startTime
    return progress
end

--------------------------------
-- MENU OPTION
--------------------------------

---Returns a new `MenuOption` instance
---@param icon? Sprite
---@param callback? function
---@return MenuOption
---@nodiscard
local function newMenuOption(icon, callback)
    local self =
    {
        pos = Vector2.new(0.5, 0.5),
        txdBg = Sprite.new("RadialMenu", "circle"),
        icon = icon or Sprite.new("RadialMenu", "question_mark"),
        m_callback = callback or function () end,
        minDiameter = 0.050,
        maxDiameter = 0.055,
        diameter = 0.050,
        m_isFocused = false,
        bgColour = RGBA.new(255, 255, 255, 120),
        onFocusColour = RGBA.new(0, 180, 180, 220)
    }
    assert(Sprite.isInstance(self.icon), "icon must be a Sprite instance or nil")
    assert(type(self.m_callback) == "function", "callback must be a function or nil, got " .. type(self.m_callback))

    ---@return boolean
    ---@nodiscard
    local isFocused = function ()
        return self.m_isFocused
    end

    local focus = function ()
        if isFocused() then
            return
        end
        self.m_isFocused = true
        local easeOut = Easing.new(100, easeOutCirc)
        util.create_tick_handler(function ()
            self.diameter = self.minDiameter + (self.maxDiameter - self.minDiameter) * easeOut:getProgress()
            return isFocused() and self.diameter ~= self.maxDiameter
        end)
    end

    local unfocus = function ()
        if not isFocused() then
            return
        end
        self.m_isFocused = false
        local easeIn = Easing.new(100, easeInCirc)
        util.create_tick_handler(function ()
            self.diameter =  self.maxDiameter - (self.maxDiameter - self.minDiameter) * (1 - easeIn:getProgress())
            return not isFocused() and self.diameter ~= self.minDiameter
        end)
    end

    ---@return boolean
    ---@nodiscard
    local isReticleInOptArea = function ()
        local a = self.diameter / 2                     -- horizantal max distance to consider an option as selected
        local b = a * GRAPHICS._GET_ASPECT_RATIO(0)     -- vertical max distance
        local center = Vector2.new(0.5, 0.5)
        local rel = self.pos - center
        local t = math.atan(rel.y / GRAPHICS._GET_ASPECT_RATIO(0), rel.x)
        local radius = Vector2.new(a * math.cos(t), b * math.sin(t))
        return Vector2.dot(rel, rel) <= Vector2.dot(radius, radius)
    end

    ---Sets the option position. Requires `pos` to be a `Vector2` instance.
    ---@param pos Vector2
    local setPosition = function (pos)
        assert(Vector2.isInstance(pos), "pos must be a Vector2 instance")
        self.pos = pos
    end

    local draw = function ()
        local bgColour = self.bgColour
        if isFocused() then
            bgColour = self.onFocusColour
        end
        local aspectRatio = GRAPHICS._GET_ASPECT_RATIO(0)
        self.txdBg:draw(self.pos.x, self.pos.y, self.diameter, self.diameter * aspectRatio, 0, bgColour)
        self.icon:draw(self.pos.x, self.pos.y, 0.03, 0.03 * aspectRatio, 0)
    end

    ---@param callback function
    local setCallback = function (callback)
        self.m_callback = callback
    end

    ---Calls the option's callback
    local callback = function ()
        return self.m_callback()
    end

    ---@return table
    ---@nodiscard
    local getBgColour = function ()
        return self.bgColour:getTable()
    end

    ---@return table
    ---@nodiscard
    local getOnFocusColour = function ()
        return self.onFocusColour:getTable()
    end

    ---@param colour table
    local setBgColour = function (colour)
        self.bgColour = RGBA.fromTable(colour)
    end

    ---@param colour table
    local setOnFocusColour = function (colour)
        self.onFocusColour = RGBA.fromTable(colour)
    end

    ---@param icon Sprite
    local setIcon = function (icon)
        self.icon = icon
    end

    ---@class MenuOption
    local t =
    {
        isFocused = isFocused,
        focus = focus,
        unfocus = unfocus,
        isReticleInOptArea = isReticleInOptArea,
        draw = draw,
        setCallback = setCallback,
        setPosition = setPosition,
        callback = callback,
        getBgColour = getBgColour,
        getOnFocusColour = getOnFocusColour,
        setBgColour = setBgColour,
        setOnFocusColour = setOnFocusColour,
        setIcon = setIcon,
    }
    return t
end

--------------------------------
-- MENU
--------------------------------

MenuFlag_noAutoUnfocus = 1 << 0
MenuFlag_disableReticle = 1 << 1
local MenuFlag_isOpen =  1 << 2
MenuFlag_freezePosition = 1 << 3
MenuFlag_disableOpenKey = 1 << 4

---Returns a new `Menu` instance.
---1) `openKey`: the control Id to open/close the menu.
---@param openKey integer
---@return Menu
---@nodiscard
newMenu = function (openKey)
    local self =
    {
        openKey = openKey or 27,
        pos = Vector2.new(0.5, 0.5),
        ---@type MenuOption[]
        options = {},
        numOptions = 0,
        txdReticle = Sprite.new("RadialMenu", "reticle"),
        flags = 0,
        selectedOptionId = -1,
        radius = 0.0,
        maxDistance = 0.15
    }
    assert(math.type(self.openKey) == "integer", "openKey must be an integer or nil")

    ---@return number
    ---@nodiscard
    local getMaxRadius = function ()
        return math.max(0.04, self.numOptions / 100)
    end

    ---@param flag integer
    ---@return boolean
    ---@nodiscard
    local isFlagEnabled = function (flag)
        assert(math.type(flag) == "integer", "flag must be an integer")
        return (self.flags & flag) ~= 0
    end

    ---@param flag integer
    local enableFlag = function (flag)
        assert(math.type(flag) == "integer", "flag must be an integer")
        self.flags = self.flags | flag
    end

    ---@param flag integer
    local disableFlag = function (flag)
        assert(math.type(flag) == "integer", "flag must be an integer")
        self.flags = self.flags & ~flag
    end

    ---Adds a new option to the menu. Returns the option Id.
    ---1) `icon`: a `Sprite` instance
    ---2) `callback`: the function to be called if the option was selected
    ---@param icon? table
    ---@param callback? function
    ---@return integer
    local addOption = function (icon, callback)
        local option = newMenuOption(icon, callback)
        table.insert(self.options, option)
        self.numOptions = self.numOptions + 1
        return self.numOptions
    end

    ---Returns the menu maximum distance from reticle position
    ---@return number
    ---@nodiscard
    local function getMaxDistance()
        return self.maxDistance
    end

    ---Sets the menu maximum distance from reticle position
    ---@param distance number
    local function setMaxDistance(distance)
        assert(type(distance) == "number", "distance must be a number")
        self.maxDistance = distance
    end

    ---@return boolean
    ---@nodiscard
    local isOpen = function ()
        return isFlagEnabled(MenuFlag_isOpen)
    end

    ---Moves the menu so options can be selected. Private.
    local translate = function ()
        local axisX = PAD.GET_CONTROL_UNBOUND_NORMAL(2, 220) -- when mouse moves in x axis
        local axisY = PAD.GET_CONTROL_UNBOUND_NORMAL(2, 221) -- when mouse moves in y axis
        if axisX ~= 0 or axisY ~= 0 then
            local center = Vector2.new(0.5, 0.5)
            local delta = -Vector2.new(axisX, axisY) * 0.05
            local r = self.pos + delta - center
            local t = math.atan(r.y / GRAPHICS._GET_ASPECT_RATIO(0), r.x)
            local radius = Vector2.new(math.cos(t), GRAPHICS._GET_ASPECT_RATIO(0) * math.sin(t)) * self.maxDistance
            if r:dot(r) >= radius:dot(radius)  then
                self.pos = center + radius
            else
                self.pos = center + r
            end
        end
    end

    local open = function ()
        if isFlagEnabled(MenuFlag_isOpen) then
            return
        end
        self.pos = Vector2.new(0.5, 0.5)
        enableFlag(MenuFlag_isOpen)
        local easeOut = Easing.new(700, easeOutElastic)
        util.create_tick_handler(function ()
            self.radius = getMaxRadius() * easeOut:getProgress()
            return isFlagEnabled(MenuFlag_isOpen) and easeOut.time < easeOut.duration
        end)
        AUDIO.PLAY_SOUND_FRONTEND(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    end

    local close = function ()
        if not isFlagEnabled(MenuFlag_isOpen) then
            return
        end
        local currentRadius = math.min(self.radius, getMaxRadius())
        disableFlag(MenuFlag_isOpen)
        local easeIn = Easing.new(200, easeInBack)
        util.create_tick_handler(function ()
            self.radius = currentRadius * (1 - easeIn:getProgress())
            return not isFlagEnabled(MenuFlag_isOpen) and self.radius ~= 0
        end)
        AUDIO.PLAY_SOUND_FRONTEND(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    end

    ---Returns `true` if the open key was just released and an option was selected.
    ---@return boolean
    ---@nodiscard
    local isAnyOptionSelected = function ()
        return PAD.IS_DISABLED_CONTROL_JUST_RELEASED(2, self.openKey) and self.selectedOptionId ~= -1
    end

    ---Draws the menu on screen. Requires on tick call.
    local draw = function ()
        if self.numOptions == 0 then
            return
        end
        if not isFlagEnabled(MenuFlag_disableOpenKey) then
            if PAD.IS_DISABLED_CONTROL_JUST_PRESSED(2, self.openKey) then
                open()
            end
            if not PAD.IS_DISABLED_CONTROL_PRESSED(2, self.openKey) then
                close()
            end
        end
        if self.radius > 0.05 * getMaxDistance() then
            if not isFlagEnabled(MenuFlag_freezePosition) then
                translate()
            end
            local newSelectedOptId = -1
            for i, option in ipairs(self.options) do
                local deltaTheta = (2 * math.pi) / self.numOptions
                local theta = (1 - i) * deltaTheta - math.pi / 2
                local delta = Vector2.new()
                delta.x = self.radius * math.cos(theta)
                delta.y = self.radius * math.sin(theta) * GRAPHICS._GET_ASPECT_RATIO(0)
                option.setPosition(self.pos + delta)
                if isOpen() then
                    if self.radius > 0.8 * getMaxRadius() and option.isReticleInOptArea() then
                        option.focus()
                        newSelectedOptId = i
                    elseif not isFlagEnabled(MenuFlag_noAutoUnfocus) and option.isFocused() then
                        -- when reticle is not in option's area, it is auto unfocus here
                        option.unfocus()
                    end
                end
                option.draw()
            end
            self.selectedOptionId = isOpen() and newSelectedOptId or self.selectedOptionId
            if isAnyOptionSelected() then
                local option = self.options[ self.selectedOptionId ]
                -- calls the option callback
                util.create_thread(option.callback)
            end
        end
        if not isFlagEnabled(MenuFlag_disableReticle) then
            local reticleColour = RGBA.new(255, 255, 255, 180)
            self.txdReticle:draw(0.5, 0.5, 0.005, 0.005 * GRAPHICS._GET_ASPECT_RATIO(0), 0, reticleColour)
        end
    end

    ---Returns the last selected option Id or `-1`.
    ---@return integer
    ---@nodiscard
    local getSelectedOptionId = function ()
        return self.selectedOptionId
    end

    ---Returns wether the given optionId exists in the menu or not.
    ---@param optionId integer
    ---@return boolean
    ---@nodiscard
    local doesOptionIdExist = function (optionId)
        return optionId >= 1 and optionId <= self.numOptions
    end

    ---Resturns a `MenuOption` instance from its Id. Private.
    ---@param optionId integer
    ---@return MenuOption
    ---@nodiscard
    local getOptionFromId = function (optionId)
        if doesOptionIdExist(optionId) then
            return self.options[optionId]
        else
            error("optionId does not exist")
        end
    end

    ---@param optionId integer
    local focusOption = function (optionId)
        getOptionFromId(optionId).focus()
    end

    ---@param optionId integer
    ---@return boolean
    ---@nodiscard
    local isOptionFocused = function (optionId)
        return getOptionFromId(optionId).isFocused()
    end

    ---@param optionId integer
    local unfocusOption = function (optionId)
        getOptionFromId(optionId).unfocus()
    end

    ---@param optionId integer
    ---@return table
    ---@nodiscard
    local getOptionBgColour = function (optionId)
        return getOptionFromId(optionId).getBgColour()
    end

    ---@param optionId integer
    ---@return table
    ---@nodiscard
    local getOptionOnFocusColour = function (optionId)
        return getOptionFromId(optionId).getOnFocusColour()
    end

    ---`colour` is a table `r`, `g`, `b`, `a` and values between `0.0` and `1.0`. Such as
    ---```
    ---{r = 0.5, g = 0.0, b = 0.5, a = 1.0}
    ---```
    ---@param optionId integer
    ---@param colour table
    local setOptionOnFocusColour = function (optionId, colour)
        assert(type(colour) == "table", "colour must be a table, got " .. type(colour))
        getOptionFromId(optionId).setOnFocusColour(colour)
    end

    ---`colour` is a table `r`, `g`, `b`, `a` and values between `0.0` and `1.0`. Such as
    ---```
    ---{r = 0.5, g = 0.0, b = 0.5, a = 1.0}
    ---```
    ---@param optionId integer
    ---@param colour table
    local setOptionBgColour = function (optionId, colour)
        assert(type(colour) == "table", "colour must be a table, got " .. type(colour))
        getOptionFromId(optionId).setBgColour(colour)
    end

    ---Used once an option was added to the menu and one wants to change
    ---its callback.
    ---@param optionId integer
    ---@param callback function
    local setOptionCallback = function (optionId, callback)
        assert(type(callback) == "function", "callback must be a function, got " .. type(callback))
        getOptionFromId(optionId).setCallback(callback)
    end

    ---@param optionId integer
    ---@param icon Sprite
    local setOptionIcon = function (optionId, icon)
        assert(Sprite.isInstance(icon), "icon must be a Sprite instance")
        getOptionFromId(optionId).setIcon(icon)
    end

    ---Returns the number of options added to the menu.
    ---@return integer
    local options = function ()
        return self.numOptions
    end

    ---@class Menu
    local t =
    {
        enableFlag = enableFlag,
        disableFlag = disableFlag,
        isFlagEnabled = isFlagEnabled,
        addOption = addOption,
        getMaxDistance = getMaxDistance,
        setMaxDistance = setMaxDistance,
        open = open,
        close = close,
        isOpen = isOpen,
        isAnyOptionSelected = isAnyOptionSelected,
        draw = draw,
        getSelectedOptionId = getSelectedOptionId,
        options = options,
        doesOptionIdExist = doesOptionIdExist,
        focusOption = focusOption,
        unfocusOption = unfocusOption,
        isOptionFocused = isOptionFocused,
        setOptionCallback = setOptionCallback,
        getOptionBgColour = getOptionBgColour,
        getOptionOnFocusColour = getOptionOnFocusColour,
        setOptionBgColour = setOptionBgColour,
        setOptionOnFocusColour = setOptionOnFocusColour,
        setOptionIcon = setOptionIcon,
    }
    local proxy = {}
    local mt =
    {
        __newindex = function (t, k, v)
            error("attempt to update a read-only table")
        end,
        __index = t
    }
    setmetatable(proxy, mt)
    return proxy
end