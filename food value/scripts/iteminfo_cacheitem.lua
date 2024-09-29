local CacheItem = Class(function(self, inst)
	if not inst then return end

	self.prefab = inst.prefab
	self.components = {}
	
	
	if inst.components.equippable then
		self.components.equippable = {}
		
		if inst.components.equippable.dapperness and inst.components.equippable.dapperness ~= 0 then
			self.components.equippable.dapperness = inst.components.equippable.dapperness
		end
	end
	
	if inst.components.perishable and MOD_ITEMINFO.PERISHABLE ~= MOD_ITEMINFO.PERISH_DISPLAY.NONE then
		self.components.perishable = {}
		self.components.perishable.perishtime = inst.components.perishable.perishtime
	end
	
	if inst.components.insulator then
		self.components.insulator = {}
		self.components.insulator.insulation = inst.components.insulator.insulation
		
		if inst.components.insulator.type == SEASONS.WINTER then
			self.components.insulator.type = "winter"
		else
			self.components.insulator.type = "summer"
		end
	end
	
	if inst.components.waterproofer then
		self.components.waterproofer = {}
		self.components.waterproofer.effectiveness = inst.components.waterproofer:GetEffectiveness()
	end

	
	if inst.components.finiteuses then
		-- Ensure that the consumption table is non-empty
		if next(inst.components.finiteuses.consumption) then
			local consumption_per_use = nil
			
			for _, v in pairs(inst.components.finiteuses.consumption) do
				if not consumption_per_use or v < consumption_per_use then
					consumption_per_use = v
				end
			end
	
			-- Calculate max uses and round to the nearest integer
			local maxuses = math.floor(inst.components.finiteuses.total / consumption_per_use + 0.5)
	
			-- Copy the relevant values
			self.components.finiteuses = {
				consumption = inst.components.finiteuses.consumption,
				total = inst.components.finiteuses.total,
				maxuses = maxuses
			}
		else
			-- Handle the case where the consumption table is empty
			self.components.finiteuses = {
				consumption = {},
				total = inst.components.finiteuses.total,
				maxuses = 0  -- Default to 0 if no consumption values are found
			}
		end
	end
	
	
	
	if inst.components.weapon then
		self.components.weapon = {}
		self.components.weapon.damage = inst.components.weapon.damage
		
	end

	if inst.components.planardamage then
		self.components.planardamage = {}
		self.components.planardamage.basedamage = inst.components.planardamage.basedamage
		
	end
	
	if inst.components.fueled then
		self.components.fueled = {}
		self.components.fueled.maxfuel = inst.components.fueled.maxfuel
		
		
		if inst.components.fueled.fueltype == FUELTYPE.USAGE then
			self.components.fueled.fueltype = "wearable"
		else
			self.components.fueled.fueltype = "light"
		end
	end
	
	if inst.components.armor then
		self.components.armor = {}
		self.components.armor.absorb_percent = inst.components.armor.absorb_percent
		self.components.armor.maxcondition = inst.components.armor.maxcondition
	end
	
	if inst.components.healer then
		self.components.healer = {}
		self.components.healer.health = inst.components.healer.health
	end
	
	if inst.components.edible then
		self.components.edible = {}
		self.components.edible.foodtype = inst.components.edible.foodtype
		self.components.edible.hunger = inst.components.edible.hungervalue
		self.components.edible.sanity = inst.components.edible.sanityvalue
		self.components.edible.health = inst.components.edible.healthvalue
        self.components.edible.temperaturedelta = inst.components.edible.temperaturedelta
        self.components.edible.temperatureduration = inst.components.edible.temperatureduration
        self.components.edible.nochill = inst.components.edible.nochill 
        self.components.edible.spice = inst.components.edible.spice
	end
end)

return CacheItem