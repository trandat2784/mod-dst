local function CalculateBuckDelay(inst)
    local domestication =
        inst.components.domesticatable ~= nil
        and inst.components.domesticatable:GetDomestication()
        or 0

    local moodmult =
        (   (inst.components.herdmember ~= nil and inst.components.herdmember.herd ~= nil and inst.components.herdmember.herd.components.mood ~= nil and inst.components.herdmember.herd.components.mood:IsInMood()) or
            (inst.components.mood ~= nil and inst.components.mood:IsInMood())   )
        and TUNING.BEEFALO_BUCK_TIME_MOOD_MULT
        or 1
	  
    local beardmult =
        (inst.components.beard ~= nil and inst.components.beard.bits == 0)
        and TUNING.BEEFALO_BUCK_TIME_NUDE_MULT
        or 1

    local domesticmult =
        inst.components.domesticatable:IsDomesticated()
        and 1
        or TUNING.BEEFALO_BUCK_TIME_UNDOMESTICATED_MULT

    local basedelay = _G.Remap(domestication, 0, 1, TUNING.BEEFALO_MIN_BUCK_TIME, TUNING.BEEFALO_MAX_BUCK_TIME)

    return basedelay * moodmult * beardmult * domesticmult
end

local function GetTime(parent)
	local current_time = parent.player_classified.MountStartTime + parent.player_classified.CurrentBuckDelay - _G.GetTime()
    if current_time >= 0 then
        local seconds = math.floor(current_time % 60)
        local displayTime = math.floor(current_time / 60) .. ":" .. (seconds < 10 and "0" .. seconds or seconds)
		return displayTime
    else
		return "0:00"
	end	
end

local function OnMounted(parent, data)
	if not data.target or parent.player_classified == nil or data.target.prefab ~= "beefalo" then return end
	parent.player_classified.mountwidgetvisible:set(true)
	parent.player_classified.MountStartTime = _G.GetTime()
	parent.player_classified.CurrentBuckDelay = CalculateBuckDelay(data.target)
	parent:ListenForEvent("healthdelta", parent.player_classified._OnMountHealthDelta, data.target)
	parent:ListenForEvent("domesticationdelta", parent.player_classified._OnMountDomesticationDelta, data.target)
	parent:ListenForEvent("obediencedelta", parent.player_classified._OnMountObedienceDelta, data.target)
	
	parent.player_classified.mountmaxhealth:set(data.target.components.health.maxhealth)
	parent.player_classified.mounthealth:set(data.target.components.health.currenthealth)
	parent.player_classified.mountdomestication:set(100*data.target.components.domesticatable:GetDomestication())
	parent.player_classified.mountobedience:set(100*data.target.components.domesticatable:GetObedience())
	parent.player_classified.mountbuckdelay:set(GetTime(parent))
    data.target.bucktask = data.target:DoPeriodicTask(1, function()
		parent.player_classified.mountbuckdelay:set(GetTime(parent))
	end)
end

local function OnDismounted(parent, data)
	if data.target.bucktask ~= nil then
		data.target.bucktask:Cancel()
		data.target.bucktask = nil
	end
	parent.player_classified.mountwidgetvisible:set(false)
	parent:RemoveEventCallback("healthdelta", parent.player_classified._OnMountHealthDelta, data.target)
	parent:RemoveEventCallback("domesticationdelta", parent.player_classified._OnMountDomesticationDelta, data.target)
	parent:RemoveEventCallback("obediencedelta", parent.player_classified._OnMountObedienceDelta, data.target)
end

local function MountWidgetVisibleDirty(inst)
	if inst.mountwidgetvisible:value() then
		inst._parent.HUD:OpenBeefalo()
	else
		inst._parent.HUD:CloseBeefalo()
	end
end

local function RegisterNetListeners(inst)
	inst._parent = inst._parent or inst.entity:GetParent()
	if ismastersim then
		inst:ListenForEvent("mounted", OnMounted, inst._parent)
		inst:ListenForEvent("dismounted", OnDismounted, inst._parent)

		if inst._parent.components.rider.mount then
			OnMounted(inst._parent, {target = inst._parent.components.rider.mount})
		end
	end
	if GLOBAL.ThePlayer and GLOBAL.ThePlayer.player_classified == inst then
		inst:ListenForEvent("mountwidgetvisibledirty", MountWidgetVisibleDirty)
		MountWidgetVisibleDirty(inst)
	end
end

AddPrefabPostInit("player_classified", function(inst)
	inst.mounthealth = GLOBAL.net_ushortint(inst.GUID, "mount.health", "mounthealthdirty")
	inst.mountmaxhealth = GLOBAL.net_ushortint(inst.GUID, "mount.maxhealth", "mountmaxhealthdirty")
	inst.mountdomestication = GLOBAL.net_ushortint(inst.GUID, "mount.domestication", "mountdomesticationdirty")
	inst.mountobedience = GLOBAL.net_ushortint(inst.GUID, "mount.obedience", "mountobediencedirty")
	inst.mountbuckdelay = GLOBAL.net_string(inst.GUID, "mount.buckdelay", "buckdelaydeltadirty")
	inst.mountwidgetvisible = GLOBAL.net_bool(inst.GUID, "mount.widgetvisible", "mountwidgetvisibledirty")
	
	inst.mounthealth:set(TUNING.BEEFALO_HEALTH)
	inst.mountmaxhealth:set(TUNING.BEEFALO_HEALTH)
	inst.mountwidgetvisible:set(false)
	
	inst._OnMountHealthDelta = function(mount, data)
		inst.mounthealth:set(mount.components.health.currenthealth)
	end
	inst._OnMountDomesticationDelta = function(mount, data)
		inst.mountdomestication:set(100*mount.components.domesticatable:GetDomestication())
	end
	inst._OnMountObedienceDelta = function(mount, data)
		inst.mountobedience:set(100*mount.components.domesticatable:GetObedience())
	end
	
	inst.MountStartTime = 0
	inst.CurrentBuckDelay = 0
	
	inst:DoTaskInTime(0, RegisterNetListeners)
end)

local BeefaloWidget = require("widgets/beefalowidget")
local PlayerHud = require("screens/playerhud")
function PlayerHud:OpenBeefalo()
	if not self.beefalowidget then
		if TUNING.BEEFALOWIDGET.POS == "top" then
			self.controls.beefalowidget = self.controls.top_root:AddChild(BeefaloWidget(self.owner))
			self.beefalowidget = self.controls.beefalowidget
			self.beefalowidget:SetScale(.6)
			self.beefalowidget:MoveToBack()
		elseif TUNING.BEEFALOWIDGET.POS == "bottom" then
			self.controls.beefalowidget = self.controls.bottom_root:AddChild(BeefaloWidget(self.owner))
			self.beefalowidget = self.controls.beefalowidget
			self.beefalowidget:SetScale(.6)
			self.beefalowidget:MoveToBack()
			self.controls.inv:Rebuild()
		end	
	end
	
	self.beefalowidget:Open()
end

function PlayerHud:CloseBeefalo()
	if self.beefalowidget then
		self.beefalowidget:Close()
	end
end

if TUNING.BEEFALOWIDGET.POS == "bottom" then
	local Inv = require("widgets/inventorybar")
	local _Rebuild = Inv.Rebuild
	function Inv:Rebuild(...)
		_Rebuild(self, ...)
		if self.owner.HUD.beefalowidget then
			self.owner.HUD.beefalowidget:UpdatePosition()
		end
	end
end	