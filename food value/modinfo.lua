name = "Item Info Updated"
description = "Item Info Updated by Alti."
author = "Alti, 無名, 微笑的浮梦月见, Nathalia, Ryuu"
version = "1.19.4"
icon_atlas = "item_info.xml"
icon = "item_info.tex"
forumthread = ""
api_version_dst = 10
priority = 100

-- Only compatible with DST
dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false
dst_compatible = true

--This lets clients know if they need to get the mod from the Steam Workshop to join the game
all_clients_require_mod = false

--This determines whether it causes a server to be marked as modded (and shows in the mod list)
client_only_mod = true

--These tags allow the server running this mod to be found with filters from the server listing screen
server_filter_tags = {""}

MarginValues = {}
for i=1, 101 do
	MarginValues[i] = {description = "" .. ((i - 1)) * 10, data = ((i - 1) * 10)}
end

ScaleValues = {}
local startValue = 0.2
local increment = 0.01
local count = ((1.5 - startValue) / increment) + 1

for i = 1, count do
    local value = startValue + (i - 1) * increment
    ScaleValues[i] = { description = "" .. value, data = value }
end



configuration_options =
{
	{
		name = "INFO_SCALE",
		label = "Info scale",
		hover = "Sets the tooltips' info scale",
		options =	ScaleValues,
		default = 0.8,
	},
	{
		name = "TIME_FORMAT",
		label = "Time format",
		hover = "Set the display time format",
		options =	{
						{description = "Hours", data = 0},
						{description = "Days", data = 1},
					},
		default = 0,
	},
	{
		name = "PERISHABLE",
		label = "Perish info",
		hover = "Set the way you want to see the stale, perish timer and freshness percentage.",
		options =	{
						{description = "Perish only", data = 0},
						{description = "Stale>perish", data = 1},
						{description = "Show all", data = 2},
						{description = "Show none", data = 3},
					},
		default = 2,
	},
	{
		name = "WURT_MEAT",
		label = "Wurt | Meat dishes stats",
		hover = "Set to Yes if you want to see meat stats (hungry, sanity, health) when playing as Wurt",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WIG_VEGGIE",
		label = "Wigfrid | Veggie dishes stats",
		hover = "Set to Yes if you want to see veggie stats (hungry, sanity, health) when playing as Wigfrid",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "WORM_HEALTH",
		label = "Wormwood | Dishes health stat",
		hover = "Set to Yes if you want to see health stat when playing as Wormwood",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "SHOW_INFO_HANDS",
		label = "Show hands",
		hover = "Set to Yes if you want to see your hands equipped item info",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = true,
	},
	{
		name = "SHOW_INFO_BODY",
		label = "Show body",
		hover = "Set to Yes if you want to see your body equipped item info",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = true,
	},
	{
		name = "SHOW_INFO_HEAD",
		label = "Show head",
		hover = "Set to Yes if you want to see your head equipped item info",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = true,
	},
	{
		name = "EQUIP_SCALE",
		label = "Equipped scale",
		hover = "Sets the equipped item info scale. This doesn't affects the tooltips",
		options =	ScaleValues,
		default = 0.46,
	},
	{
		name = "SHOW_PREFABNAME",
		label = "Prefab name",
		hover = "Set to Yes if you want to display the item's prefab",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "SHOW_BACKGROUND",
		label = "Show background",
		hover = "Set to Yes if you want to see a background behind your equipped item's info",
		options =	{
						{description = "Yes", data = true},
						{description = "No", data = false},
					},
		default = false,
	},
	{
		name = "HORIZONTAL_MARGIN",
		label = "Bottom Margin",
		hover = "Set the equip info bottom margin",
		options =	MarginValues,
		default = 100,
	},
	{
		name = "VERTICAL_MARGIN",
		label = "Right Margin",
		hover = "Set the equip info right margin",
		options =	MarginValues,
		default = 100,
	},
	{
		name = "ENABLER",
		label = "Use with Show me/Insight",
		hover = "Toggle to Enable/Disable the mod when the server is using Insight (Show Me+)/Show Me (Origin)/Show Me(中文).",
		options = {
			{description = "Yes", data = true},
			{description = "No", data = false},
		},
		default = true,
	},
	
}