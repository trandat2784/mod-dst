local DST = GLOBAL.TheSim:GetGameID() == "DST"
if not DST then return end
if DST and GLOBAL.TheNet:IsDedicated() then return end

local require = GLOBAL.require
local CacheItem = require("iteminfo_cacheitem")
local Image = require("widgets/image")
local ItemInfoDesc = require("widgets/iteminfo_desc")
local ItemInfoEquip = require("widgets/iteminfo_equip")
local ItemInfoEquipManager = require("widgets/iteminfo_equip_manager")
local EntityScript = require("entityscript")

GLOBAL.MOD_ITEMINFO = {}

GLOBAL.MOD_ITEMINFO.SHOW_PREFABNAME = GetModConfigData("SHOW_PREFABNAME")
GLOBAL.MOD_ITEMINFO.SHOW_BACKGROUND = GetModConfigData("SHOW_BACKGROUND")

GLOBAL.MOD_ITEMINFO.WURT_MEAT = GetModConfigData("WURT_MEAT")
GLOBAL.MOD_ITEMINFO.WIG_VEGGIE = GetModConfigData("WIG_VEGGIE")
GLOBAL.MOD_ITEMINFO.WORM_HEALTH = GetModConfigData("WORM_HEALTH")

GLOBAL.MOD_ITEMINFO.INFO_SCALE = GetModConfigData("INFO_SCALE")
GLOBAL.MOD_ITEMINFO.EQUIP_SCALE = GetModConfigData("EQUIP_SCALE")

GLOBAL.MOD_ITEMINFO.PERISHABLE = GetModConfigData("PERISHABLE")
GLOBAL.MOD_ITEMINFO.PERISH_DISPLAY = {PERISH_ONLY = 0, STALE_PERISH = 1, BOTH = 2, NONE = 3}

GLOBAL.MOD_ITEMINFO.TIME_FORMAT = GetModConfigData("TIME_FORMAT")
GLOBAL.MOD_ITEMINFO.TIME_FORMATS = {HOURS = 0, DAYS = 1}

GLOBAL.MOD_ITEMINFO.SLOT_UPDATE_TIME = 0.2
GLOBAL.MOD_ITEMINFO.EQUIP_UPDATE_TIME = 0.2

GLOBAL.MOD_ITEMINFO.MARGINH = GetModConfigData("HORIZONTAL_MARGIN")
GLOBAL.MOD_ITEMINFO.MARGINV = GetModConfigData("VERTICAL_MARGIN")

GLOBAL.MOD_ITEMINFO.EQUIP_SPACING = 10

GLOBAL.MOD_ITEMINFO.SPAWNING_ITEM = false


GLOBAL.MOD_ITEMINFO.CACHED_ITEMS = {}

Assets =
{
	Asset("ATLAS", "images/iteminfo_images.xml"),
	Asset("IMAGE", "images/iteminfo_images.tex"),
	
	Asset("ATLAS", "images/iteminfo_bg.xml"),
	Asset("IMAGE", "images/iteminfo_bg.tex"),
}

local ENABLER = GetModConfigData("ENABLER")

if not ENABLER then

    local CHECK_MODS = {
        ["workshop-2189004162"] = "INSIGHT",
        ["workshop-666155465"] = "SHOWME",
        ["workshop-2287303119"] = "SHOWME(中文)",
    }

    local HAS_MOD = {}

    -- Checks for default Host mods
    for mod_id, mod_name in pairs(CHECK_MODS) do
        HAS_MOD[mod_name] = HAS_MOD[mod_name] or (GLOBAL.KnownModIndex:IsModEnabled(mod_id) and mod_id)
    end

    -- Checks for Dedicated Server mods
    for _, mod_id in pairs(GLOBAL.KnownModIndex:GetModsToLoad()) do
        local mod_name = CHECK_MODS[mod_id]
        if mod_name then
            HAS_MOD[mod_name] = mod_id
        end
    end

    if HAS_MOD.INSIGHT or HAS_MOD.SHOWME or HAS_MOD["SHOWME(中文)"] then
        return
    end

end






AddGlobalClassPostConstruct("entityscript","EntityScript", function(self)
	local oldRegisterComponentActions = self.RegisterComponentActions
	
	self.RegisterComponentActions = function(self, name)
		if GLOBAL.MOD_ITEMINFO.SPAWNING_ITEM then
			return
		end
		
		return oldRegisterComponentActions(self, name)
	end
end) 

local function IsControllerEnabled()
	return GLOBAL.TheInput.ControllerAttached()
end

local function AddItemInfo(slot)
    if not slot.iteminfo then
        slot.iteminfo = GLOBAL.ThePlayer.HUD.controls:AddChild(ItemInfoDesc(slot))

        -- Itemslot is 64x64, anchor points = H:CENTER, V:CENTER
        slot.iteminfo:SetPosition(0, 144, 0)
        -- slot.iteminfo:FollowMouse()

        slot.iteminfo.relative_scale = GLOBAL.MOD_ITEMINFO.INFO_SCALE
        slot.iteminfo:Hide()
    end

    local oldOnGainFocus = slot.OnGainFocus
    slot.OnGainFocus = function (slot)
        if slot.tile and slot.tile.item then
            slot.iteminfo.item = slot.tile.item
            slot.iteminfo:ShowInfo()
        end

        slot.iteminfo:StartUpdating()

        if oldOnGainFocus then return oldOnGainFocus(slot) end
    end

    local oldOnLoseFocus = slot.OnLoseFocus
    slot.OnLoseFocus = function (slot)
        slot.iteminfo:SetInactive()

        if oldOnLoseFocus then return oldOnLoseFocus(slot) end
    end
end






AddClassPostConstruct("widgets/invslot", function(invslot)
	
	AddItemInfo(invslot)
	
	local oldClick = invslot.Click
	invslot.Click = function(invslot, stack_mod)
		local res = oldClick(invslot, stack_mod)
		if invslot.tile and invslot.tile.item then
			invslot.iteminfo.item = invslot.tile.item
			invslot.iteminfo:ShowInfo()
			invslot.iteminfo:StartUpdating()
		end
		return res
	end
end)

AddClassPostConstruct("widgets/equipslot", function(equipslot)
	
	AddItemInfo(equipslot)
	
	local oldOnControl = equipslot.OnControl
	equipslot.OnControl = function(equipslot, control, down)
		local res = oldOnControl(equipslot, control, down)
		if (control == GLOBAL.CONTROL_ACCEPT or control == GLOBAL.CONTROL_SECONDARY) then
			if equipslot.tile and equipslot.tile.item then
				equipslot.iteminfo.item = equipslot.tile.item
				equipslot.iteminfo:ShowInfo()
				equipslot.iteminfo:StartUpdating()
			end
		end
		return res
	end
end)



-- Controller support
AddClassPostConstruct("widgets/inventorybar", function(self)
	local _SelectSlot = self.SelectSlot
	self.SelectSlot = function(self, slot)
		if GLOBAL.TheInput:ControllerAttached() then
			if slot and slot ~= self.active_slot then
				
				if self.active_slot and self.active_slot.iteminfo then
					self.active_slot.iteminfo:SetInactive()
				end
				
				if slot.iteminfo then
					if slot.tile and slot.tile.item then
						slot.iteminfo.item = slot.tile.item
						slot.iteminfo:ShowInfo()
					end
				
					slot.iteminfo:StartUpdating()
				end
			end
		end
		return _SelectSlot(self, slot)
	end
end)


AddClassPostConstruct("widgets/containerwidget", function(self)
	local _Open = self.Open
	self.Open = function(self, container, doer)
		_Open(self, container, doer)
		for i,v in ipairs(self.inv) do
			if v.iteminfo then v.iteminfo.container = container end
		end
	end
	
	local _Close = self.Close
	self.Close = function(self, container, doer)
		for i,v in ipairs(self.inv) do
			if v.iteminfo then v.iteminfo:Kill() end
		end
		_Close(self, container, doer)
	end
end)

local SHOW_INFO_HANDS = GetModConfigData("SHOW_INFO_HANDS")
local SHOW_INFO_BODY = GetModConfigData("SHOW_INFO_BODY")
local SHOW_INFO_HEAD = GetModConfigData("SHOW_INFO_HEAD")

local EQUIP_SCALE = GLOBAL.MOD_ITEMINFO.EQUIP_SCALE

local EquipInfoHeight = 175 * EQUIP_SCALE

local MaxWidth = 420
local MaxHeight = 50 * 5


AddClassPostConstruct("widgets/controls", function(controls)

	controls.iteminfo_equip_manager = controls.bottomright_root:AddChild(ItemInfoEquipManager(controls.bottomright_root))
	
	controls.iteminfo_equip_manager:SetPosition(GLOBAL.MOD_ITEMINFO.MARGINH * -1, GLOBAL.MOD_ITEMINFO.MARGINV, 0)
	
	local hudscale = controls.bottomright_root:GetScale()
	controls.iteminfo_equip_manager:SetScale(EQUIP_SCALE * hudscale.x, EQUIP_SCALE * hudscale.y, EQUIP_SCALE * hudscale.z)
	
	
	if SHOW_INFO_HANDS then
		controls.iteminfo_equip_manager:AddEquip(GLOBAL.EQUIPSLOTS.HANDS)
	end
	
	if SHOW_INFO_BODY then
		controls.iteminfo_equip_manager:AddEquip(GLOBAL.EQUIPSLOTS.BODY)
		
		if GLOBAL.EQUIPSLOTS.BACK then
			controls.iteminfo_equip_manager:AddEquip(GLOBAL.EQUIPSLOTS.BACK)
		end
		
		if GLOBAL.EQUIPSLOTS.NECK then
			controls.iteminfo_equip_manager:AddEquip(GLOBAL.EQUIPSLOTS.NECK)
		end
	end
	
	if SHOW_INFO_HEAD then
		controls.iteminfo_equip_manager:AddEquip(GLOBAL.EQUIPSLOTS.HEAD)
	end
	
end)