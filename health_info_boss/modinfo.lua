name = "Simple Health Bar DST"
version = "1.06"
description =  "Version:"..version.."\nSimple Health Bar (Old)"
-- description =  "版本:"..version.."\n简单的血条显示 \n附带伤害显示"
author = "DYC"
forumthread = ""
api_version = 6


dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true

dst_compatible = true
all_clients_require_mod = true
client_only_mod = false
server_only_mod = true

server_filter_tags = { "Simple Health Bar (Old) "..version, "DYC" }

icon_atlas = "preview.xml"
icon = "preview.tex"

configuration_options =
{
	{
		name = "hbstyle",
		label = "Style样式",
		hover = "",
		options =	{
						{description = "Hidden隐藏", data = "hidden", hover = "Hide healthbar 隐藏血条"},
						{description = "♥♥♥♡♡", data = "heart", hover = "Heart. 心形血格"},
						{description = "●●●○○", data = "circle", hover = "Circle. 圆形血格"},
						{description = "■■■□□", data = "square", hover = "Square. 方块形血格"},
						{description = "◆◆◆◇◇", data = "diamond", hover = "Diamond. 菱形血格"},
						{description = "★★★☆☆", data = "star", hover = "Star. 星形血格"},
					},
		default = "heart",
	},
	
	{
		name = "value",
		label = "Value数值",
		hover = "Show health value?是否显示生命值",
		options =	{
						{description = "Shown显示", data = true, hover = ""},
						{description = "Hidden隐藏", data = false, hover = ""},
					},
		default = true,
	},
	
	{
		name = "hblength",
		label = "Length长度",
		hover = "",
		options =	{
						{description = "5", data = 5, hover = ""},
						{description = "6", data = 6, hover = ""},
						{description = "8", data = 8, hover = ""},
						{description = "10", data = 10, hover = ""},
					},
		default = 10,
	},
	
	{
		name = "hbpos",
		label = "Pos位置",
		hover = "",
		options =	{
						{description = "Bottom脚下", data = 0, hover = ""},
						{description = "OverHead头顶", data = 1, hover = ""},
					},
		default = 1,
	},
	
	{
		name = "hbcolor",
		label = "Color颜色",
		hover = "",
		options =	{
						{description = "Dynamic动态", data = "dynamic", hover = ""},
						{description = "White白", data = "white", hover = ""},
						{description = "Black黑", data = "black", hover = ""},
						{description = "Red红", data = "red", hover = ""},
						{description = "Green绿", data = "green", hover = ""},
						{description = "Blue蓝", data = "blue", hover = ""},
						{description = "Yellow黄", data = "yellow", hover = ""},
						{description = "Cyan青", data = "cyan", hover = ""},
						{description = "Magenta品红", data = "magenta", hover = ""},
						{description = "Gray灰", data = "gray", hover = ""},
						{description = "Orange橙", data = "orange", hover = ""},
						{description = "Purple紫", data = "purple", hover = ""},
					},
		default = "dynamic",
	},
	
	{
		name = "ddon",
		label = "DD显伤",
		hover = "Damage display. 伤害显示",
		options =	{
						{description = "On开启", data = true, hover = ""},
						{description = "Off关闭", data = false, hover = ""},
					},
		default = true,
	},
	
}







-- configuration_options =
-- {
	-- {
		-- name = "hbstyle",
		-- label = "样式",
		-- hover = "",
		-- options =	{
						-- {description = "隐藏", data = "hidden", hover = "隐藏血条"},
						-- {description = "♥♥♥♡♡", data = "heart", hover = "心形血格"},
						-- {description = "●●●○○", data = "circle", hover = "圆形血格"},
						-- {description = "■■■□□", data = "square", hover = "方块形血格"},
						-- {description = "◆◆◆◇◇", data = "diamond", hover = "菱形血格"},
						-- {description = "★★★☆☆", data = "star", hover = "星形血格"},
					-- },
		-- default = "heart",
	-- },
	
	-- {
		-- name = "value",
		-- label = "数值",
		-- hover = "是否显示生命值",
		-- options =	{
						-- {description = "显示", data = true, hover = ""},
						-- {description = "隐藏", data = false, hover = ""},
					-- },
		-- default = true,
	-- },
	
	-- {
		-- name = "hblength",
		-- label = "长度",
		-- hover = "",
		-- options =	{
						-- {description = "5", data = 5, hover = ""},
						-- {description = "6", data = 6, hover = ""},
						-- {description = "8", data = 8, hover = ""},
						-- {description = "10", data = 10, hover = ""},
					-- },
		-- default = 10,
	-- },
	
	-- {
		-- name = "hbpos",
		-- label = "位置",
		-- hover = "",
		-- options =	{
						-- {description = "脚下", data = 0, hover = ""},
						-- {description = "头顶", data = 1, hover = ""},
					-- },
		-- default = 1,
	-- },
	
	-- {
		-- name = "hbcolor",
		-- label = "颜色",
		-- hover = "",
		-- options =	{
						-- {description = "动态", data = "dynamic", hover = ""},
						-- {description = "白", data = "white", hover = ""},
						-- {description = "黑", data = "black", hover = ""},
						-- {description = "红", data = "red", hover = ""},
						-- {description = "绿", data = "green", hover = ""},
						-- {description = "蓝", data = "blue", hover = ""},
						-- {description = "黄", data = "yellow", hover = ""},
						-- {description = "青", data = "cyan", hover = ""},
						-- {description = "品红", data = "magenta", hover = ""},
						-- {description = "灰", data = "gray", hover = ""},
						-- {description = "橙", data = "orange", hover = ""},
						-- {description = "紫", data = "purple", hover = ""},
					-- },
		-- default = "dynamic",
	-- },
	
	-- {
		-- name = "ddon",
		-- label = "显伤",
		-- hover = "",
		-- options =	{
						-- {description = "开启", data = true, hover = ""},
						-- {description = "关闭", data = false, hover = ""},
					-- },
		-- default = true,
	-- },
	
-- }