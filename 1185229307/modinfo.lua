all_clients_require_mod = true
dst_compatible = true

version = "93"
version_compatible = "57"
priority = 2 ^ 1023
api_version = 10

name = "Epic Healthbar"
author = "Tykvesh"
icon_atlas = "images/modicon.xml"
icon = "modicon.tex"
server_filter_tags = { name, author }
version_description = --•◦
[[
• Added silent capture mode.
• Improved priority when multiple bosses attack another.
]]

local LOCALE =
{
	EN =
	{
		NAME = name,
		DESCRIPTION_FMT = "Update %s:\n\n%s",
		HEADER_SERVER = "Server",
		HEADER_CLIENT = "Client",
		DISABLED = "Disabled",
		ENABLED = "Enabled",

		GLOBAL = "Mob Health",
		GLOBAL_HOVER = "Enables clients to see health for all entities.\nClients must opt-in below.",
		GLOBAL_DISABLED = "Show giants only",
		GLOBAL_ENABLED = "Show mob health",

		GLOBAL_NUMBERS = "Global Damage Numbers",
		GLOBAL_NUMBERS_HOVER = "Displays damage numbers in the world instead of the widget.\nApplicable to any combat, not just giants.",
		GLOBAL_NUMBERS_DISABLED = "Show damage on the bar",
		GLOBAL_NUMBERS_ENABLED = "Show damage in the world",

		CAPTURE = "Silent Capture Mode",
		CAPTURE_HOVER = "Instead of displaying the bar, records all fights into a file.\nCaptures can be replayed from the Host Game screen.",

		TAG = "Display Health For",
		TAG_HOVER = "Enables health bars only for selected targets.",
		TAG_NONE = "None",
		TAG_NONE_HOVER = "Type /epic in the chat if you change your mind!",
		TAG_EPIC = "Giants",
		TAG_EPIC_HOVER = "The standard experience",
		TAG_HEALTH = "All",
		TAG_HEALTH_HOVER = "If supported by the server",

		FRAME_PHASES = "Combat Phases",
		FRAME_PHASES_HOVER = "Separates bars of applicable giants by phases.",
		FRAME_PHASES_DISABLED = "Hide phases",
		FRAME_PHASES_ENABLED = "Show phases",

		DAMAGE_NUMBERS = "Damage Numbers",
		DAMAGE_NUMBERS_HOVER = "Displays received damage or healing with popup numbers.",
		DAMAGE_NUMBERS_DISABLED = "Hide numbers",
		DAMAGE_NUMBERS_ENABLED = "Show numbers",

		DAMAGE_RESISTANCE = "Damage Resistance",
		DAMAGE_RESISTANCE_HOVER = "Displays a special effect when the target receives\nless damage due to its defenses.",
		DAMAGE_RESISTANCE_DISABLED = "Hide resistance",
		DAMAGE_RESISTANCE_ENABLED = "Show resistance",

		WETNESS_METER = "Wetness",
		WETNESS_METER_HOVER = "Displays a special effect when the target becomes wet.",
		WETNESS_METER_DISABLED = "Hide wetness",
		WETNESS_METER_ENABLED = "Show wetness",

		HORIZONTAL_OFFSET = "Horizontal Offset",
		HORIZONTAL_OFFSET_HOVER = "Shifts the bar away from the center.",
		HORIZONTAL_OFFSET_LEFT = "%s units to the left",
		HORIZONTAL_OFFSET_NONE = "No offset",
		HORIZONTAL_OFFSET_RIGHT = "%s units to the right",

		CAMERA = "Combat Camera",
		CAMERA_HOVER = "Allows the camera to focus on giants while in combat.\nSitting or hiding grants spectator view.",
		CAMERA_OPTION = "Toggle",
		CAMERA_OPTION_HOVER = "Hover over the health bar to toggle",
		CAMERA_BUTTON = "Toggle Combat Camera",
		CAMERA_BUTTON_ALT = "Toggle Spectator Camera",
		CAMERA_BUTTON_FAR = "Too Far!",
		CAMERA_BUTTON_BUSY = "Not Available!",

		LOADING_TIPS =
		{
			SURVIVAL = [["Hi {username}! I hope your boss rush goes well." -T]],
			LORE = "Epic Healthbar has built-in stuff for some mods, but any mod is able to define custom themes, phases or even textures.",
			CONTROL1 = "Type /epic in the chat to configure the health bar.\nYou can also hover over it to access its menu.",
			CONTROL2 = "If health bars draw too much of your attention, set Display Health For to None in the configuration to get rid of them.",
			CONTROL3 = "Bring damage numbers straight to the battlefield with Global Damage Numbers! You can find it in Epic Healthbar's configuration.",
			OTHER = "You can help translate Epic Healthbar to your language! It already features German, Brazilian Portuguese, Russian, and Simplified Chinese translations submitted by fellow players.",
		},
	},

	DE =
	{
		TRANSLATOR = "Übersetzt von Bxucher",
		NAME = "Epischelebensleiste",
		DESCRIPTION_FMT = "Update %s:\n\n%s",
		HEADER_SERVER = "Server",
		HEADER_CLIENT = "Client",
		DISABLED = "Deaktiviert",
		ENABLED = "Aktiviert",

		GLOBAL = "Monsterleben",
		GLOBAL_HOVER = "Aktiviert das Clienten das Leben aller Monster sehen.\nClienten müssen beitreten hier drunter.",
		GLOBAL_DISABLED = "Zeige nur Riesen",
		GLOBAL_ENABLED = "Zeige alle Monster",

		GLOBAL_NUMBERS = "Globale Schadenszahlen",
		GLOBAL_NUMBERS_HOVER = "Zeigt Schadenszahlen in der Welt stat dem Widget.\nWirksam in jedem Kampf, nicht nur Riesen.",
		GLOBAL_NUMBERS_DISABLED = "Zeige Schaden in der Anzeige",
		GLOBAL_NUMBERS_ENABLED = "Zeige Schaden in der Welt",

		TAG = "Lebensleiste für",
		TAG_HOVER = "Zeigt Lebensleiste für ausgewählte Moster.",
		TAG_NONE = "Aus",
		TAG_NONE_HOVER = "Schreibe /epic in den chat wenn du deine Meinung änderst!",
		TAG_EPIC = "Riesen",
		TAG_EPIC_HOVER = "Die Standard Erfahrung",
		TAG_HEALTH = "Alle",
		TAG_HEALTH_HOVER = "Wenn unterstützt vom Server",

		FRAME_PHASES = "Kampfphasen",
		FRAME_PHASES_HOVER = "Teil die Lebensleiste in Phasen auf bei zutreffenden Riesen.",
		FRAME_PHASES_DISABLED = "Keine Phasen",
		FRAME_PHASES_ENABLED = "Zeige Phasen",

		DAMAGE_NUMBERS = "Schadenszahlen",
		DAMAGE_NUMBERS_HOVER = "Zeigt bekommenen Schaden oder Heilung mit auftauchenden Zahlen.",
		DAMAGE_NUMBERS_DISABLED = "Keine Zahlen",
		DAMAGE_NUMBERS_ENABLED = "Zeige Zahlen",

		DAMAGE_RESISTANCE = "Schadensresistenz",
		DAMAGE_RESISTANCE_HOVER = "Zeigt einen Spezialeffekt wen das Ziel weniger\nSchaden bekommt durch desen Verteidigung.",
		DAMAGE_RESISTANCE_DISABLED = "Kein Effekt",
		DAMAGE_RESISTANCE_ENABLED = "Zeige Effekt",

		WETNESS_METER = "Nässe",
		WETNESS_METER_HOVER = "Zeigt einen Spezialeffekt wen das Ziel nass wird.",
		WETNESS_METER_DISABLED = "Kein Effekt",
		WETNESS_METER_ENABLED = "Zeige Effekt",

		HORIZONTAL_OFFSET = "Horizontale Verschiebung",
		HORIZONTAL_OFFSET_HOVER = "Verschiebt die Anzeige von der Mitte weg.",
		HORIZONTAL_OFFSET_LEFT = "%s units nach Links",
		HORIZONTAL_OFFSET_NONE = "Keine verschiebung",
		HORIZONTAL_OFFSET_RIGHT = "%s units nach Rechts",

		CAMERA = "Kampfkamera",
		CAMERA_HOVER = "Erlaubt der Kamera auf Riesen zu fokussieren.\nSitzen oder verstecken gibt eine Zuschaueransicht.",
		CAMERA_OPTION = "Knopf",
		CAMERA_OPTION_HOVER = "Hover über die Lebensanzeige zum ändern",
		CAMERA_BUTTON = "Aktiviere Kampfkamera",
		CAMERA_BUTTON_ALT = "Aktiviere Zuschaueransicht",
		CAMERA_BUTTON_FAR = "Zu weit weg!",
		CAMERA_BUTTON_BUSY = "Nicht verfügbar!",
	},

	PT =
	{
		TRANSLATOR = "Traduzido por Pachibitalia",
		NAME = "Barra de Vida Épica",
		DESCRIPTION_FMT = "Atualização %s:\n\n%s",
		HEADER_SERVER = "Servidor",
		HEADER_CLIENT = "Cliente",
		DISABLED = "Desativado",
		ENABLED = "Ativado",

		GLOBAL = "Vida do Mob",
		GLOBAL_HOVER = "Permite que os clientes vejam a integridade\nde todas as entidades.",
		GLOBAL_DISABLED = "Mostrar apenas chefes",
		GLOBAL_ENABLED = "Mostrar vida do mob",

		GLOBAL_NUMBERS = "Números de Danos Globais",
		GLOBAL_NUMBERS_HOVER = "Exibe números de danos no mundo em vez da barra.\nAdequado para qualquer combate, não só contra chefes.",
		GLOBAL_NUMBERS_DISABLED = "Mostrar danos na barra",
		GLOBAL_NUMBERS_ENABLED = "Mostrar danos no mundo",

		TAG = "Exibir Saúde Para",
		TAG_HOVER = "Habilita barras de saúde somente para alvos selecionados.",
		TAG_NONE = "Nada",
		TAG_NONE_HOVER = "Digite /epic no chat se mudar de ideia!",
		TAG_EPIC = "Chefes",
		TAG_EPIC_HOVER = "A experiência padrão",
		TAG_HEALTH = "Tudo",
		TAG_HEALTH_HOVER = "Se suportado pelo servidor",

		FRAME_PHASES = "Fases do Combate",
		FRAME_PHASES_HOVER = "Separar barras de chefes aplicáveis por fases.",
		FRAME_PHASES_DISABLED = "Ocultar fases",
		FRAME_PHASES_ENABLED = "Mostrar fases",

		DAMAGE_NUMBERS = "Números de Dano",
		DAMAGE_NUMBERS_HOVER = "Mostrar dano recebido ou curado com números.",
		DAMAGE_NUMBERS_DISABLED = "Esconder números",
		DAMAGE_NUMBERS_ENABLED = "Mostrar números",

		DAMAGE_RESISTANCE = "Resistência a Dano",
		DAMAGE_RESISTANCE_HOVER = "Mostra um efeito especial quando o chefe recebe\nmenos dano de acordo com suas defesas.",
		DAMAGE_RESISTANCE_DISABLED = "Esconder resistência",
		DAMAGE_RESISTANCE_ENABLED = "Mostrar resistência",

		WETNESS_METER = "Quão Molhado Está",
		WETNESS_METER_HOVER = "Mostra um efeito especial quando o chefe fica molhado.",
		WETNESS_METER_DISABLED = "Esconder molhadeira",
		WETNESS_METER_ENABLED = "Mostrar molhadeira",

		HORIZONTAL_OFFSET = "Centralização Horizontal",
		HORIZONTAL_OFFSET_HOVER = "Move a barra para longe do centro.",
		HORIZONTAL_OFFSET_LEFT = "%s de unidades para a esquerda",
		HORIZONTAL_OFFSET_NONE = "Sem centralização",
		HORIZONTAL_OFFSET_RIGHT = "%s de unidades para a direita",

		CAMERA = "Câmera de Combate",
		CAMERA_HOVER = "Permite que a câmera foque nos chefes durante o combate.\nSentar ou se esconder concede a visão do espectador.",
		CAMERA_OPTION = "Botão",
		CAMERA_OPTION_HOVER = "Passe o mouse sobre a barra de saúde para alternar",
		CAMERA_BUTTON = "Alternar Câmera de Combate",
		CAMERA_BUTTON_ALT = "Alternar Câmera do Espectador",
		CAMERA_BUTTON_FAR = "Muito Longe!",
		CAMERA_BUTTON_BUSY = "Não Disponível!",
	},

	RU =
	{
		NAME = name,
		DESCRIPTION_FMT = "Обновление %s:\n\n%s",
		HEADER_SERVER = "Сервер",
		HEADER_CLIENT = "Клиент",
		DISABLED = "Отключено",
		ENABLED = "Включено",

		GLOBAL = "Здоровье мобов",
		GLOBAL_HOVER = "Позволяет клиентам видеть здоровье всех существ.",
		GLOBAL_DISABLED = "Показывать только боссов",
		GLOBAL_ENABLED = "Показывать всех мобов",

		GLOBAL_NUMBERS = "Глобальные значения урона",
		GLOBAL_NUMBERS_HOVER = "Показывает значения урона в самом мире вместо полоски.\nПрименимо к любому бою, а не только к боссам.",
		GLOBAL_NUMBERS_DISABLED = "Показывать урон на полоске",
		GLOBAL_NUMBERS_ENABLED = "Показывать урон в мире",

		TAG = "Отображать здоровье для",
		TAG_HOVER = "Включает полоску здоровья только для выбранных целей.",
		TAG_NONE = "Ничего",
		TAG_NONE_HOVER = "Напишите /epic в чат, если передумаете!",
		TAG_EPIC = "Боссов",
		TAG_EPIC_HOVER = "Режим по умолчанию",
		TAG_HEALTH = "Всех",
		TAG_HEALTH_HOVER = "Если поддерживается на сервере",

		FRAME_PHASES = "Фазы боя",
		FRAME_PHASES_HOVER = "Разделяет полоски применимых боссов по фазам.",
		FRAME_PHASES_DISABLED = "Не показывать фазы",
		FRAME_PHASES_ENABLED = "Показывать фазы",

		DAMAGE_NUMBERS = "Значения урона",
		DAMAGE_NUMBERS_HOVER = "Отображает значения полученного урона и исцеления.",
		DAMAGE_NUMBERS_DISABLED = "Не показывать значения",
		DAMAGE_NUMBERS_ENABLED = "Показывать значения",

		DAMAGE_RESISTANCE = "Сопротивление урону",
		DAMAGE_RESISTANCE_HOVER = "Отображает специальный эффект когда босс получает\nменьше урона из-за своей защиты.",
		DAMAGE_RESISTANCE_DISABLED = "Не показывать сопротивление",
		DAMAGE_RESISTANCE_ENABLED = "Показывать сопротивление",

		WETNESS_METER = "Влажность",
		WETNESS_METER_HOVER = "Отображает специальный эффект когда босс становится мокрым.",
		WETNESS_METER_DISABLED = "Не показывать влажность",
		WETNESS_METER_ENABLED = "Показывать влажность",

		HORIZONTAL_OFFSET = "Горизонтальное смещение",
		HORIZONTAL_OFFSET_HOVER = "Сдвигает полоску от центра экрана.",
		HORIZONTAL_OFFSET_LEFT = "%s единиц налево",
		HORIZONTAL_OFFSET_NONE = "Без смещения",
		HORIZONTAL_OFFSET_RIGHT = "%s единиц направо",

		CAMERA = "Боевая камера",
		CAMERA_HOVER = "Позволяет камере фокусироваться на боссах во время боя.\nЗа сражением можно наблюдать сидя или спрятавшись.",
		CAMERA_OPTION = "Кнопка",
		CAMERA_OPTION_HOVER = "Чтобы переключить, наведите курсор на полосу здоровья",
		CAMERA_BUTTON = "Переключить боевую камеру",
		CAMERA_BUTTON_ALT = "Переключить камеру наблюдателя",
		CAMERA_BUTTON_FAR = "Слишком далеко!",
		CAMERA_BUTTON_BUSY = "Сейчас не доступно!",
	},

	ZH =
	{
		TRANSLATOR = "由遇晚翻译",
		NAME = "史诗血量条",
		DESCRIPTION_FMT = "更新 %s:\n\n%s",
		HEADER_SERVER = "服务器",
		HEADER_CLIENT = "客户端",
		DISABLED = "关闭",
		ENABLED = "开启",
		COMMANDS = { EPIC = "史诗" },

		GLOBAL = "所有生物的血量条",
		GLOBAL_HOVER = "显示非巨兽的血量条",
		GLOBAL_DISABLED = "仅显示巨兽的血量条",
		GLOBAL_ENABLED = "显示所有生物的血量条",

		GLOBAL_NUMBERS = "全局伤害显示",
		GLOBAL_NUMBERS_HOVER = "显示世界中的伤害数字而不是小部件\n适用于任何战斗情况",
		GLOBAL_NUMBERS_DISABLED = "在小部件上显示损坏情况",
		GLOBAL_NUMBERS_ENABLED = "在游戏世界中显示伤害",

		TAG = "显示健康状况用于",
		TAG_HOVER = "仅对选定目标启用生命条",
		TAG_NONE = "无",
		TAG_NONE_HOVER = "如果您改变主意，请在聊天中输入 /史诗",
		TAG_EPIC = "巨兽",
		TAG_EPIC_HOVER = "标准体验",
		TAG_HEALTH = "一切",
		TAG_HEALTH_HOVER = "若服务器支持的话",

		FRAME_PHASES = "战斗机制阶段",
		FRAME_PHASES_HOVER = "按阶段显示巨兽的血量条",
		FRAME_PHASES_DISABLED = "隐藏阶段",
		FRAME_PHASES_ENABLED = "显示阶段",

		DAMAGE_NUMBERS = "伤害数字",
		DAMAGE_NUMBERS_HOVER = "以弹出数值的方式显示受到的伤害和治疗",
		DAMAGE_NUMBERS_DISABLED = "隐藏数值",
		DAMAGE_NUMBERS_ENABLED = "显示数值",

		DAMAGE_RESISTANCE = "抗损伤性",
		DAMAGE_RESISTANCE_HOVER = "显示抗损伤效果",
		DAMAGE_RESISTANCE_DISABLED = "隐藏抵抗",
		DAMAGE_RESISTANCE_ENABLED = "显示抵抗",

		WETNESS_METER = "潮湿度",
		WETNESS_METER_HOVER = "显示湿度效果",
		WETNESS_METER_DISABLED = "隐藏潮湿度",
		WETNESS_METER_ENABLED = "显示潮湿度",

		HORIZONTAL_OFFSET = "血量条X轴偏移",
		HORIZONTAL_OFFSET_HOVER = "将血量条进行X轴偏移",
		HORIZONTAL_OFFSET_LEFT = "往左调整 %s",
		HORIZONTAL_OFFSET_NONE = "无偏移",
		HORIZONTAL_OFFSET_RIGHT = "往右调整 %s",

		CAMERA = "战斗相机",
		CAMERA_HOVER = "允许镜头在战斗中聚焦于巨兽\n坐着或隐藏可以让观众看到",
		CAMERA_OPTION = "按钮",
		CAMERA_OPTION_HOVER = "将鼠标悬停在健康栏上进行切换",
		CAMERA_BUTTON = "切换战斗摄像机",
		CAMERA_BUTTON_ALT = "切换观察者相机",
		CAMERA_BUTTON_FAR = "太远",
		CAMERA_BUTTON_BUSY = "无法使用",
	},
}

LOCALE.BR = LOCALE.PT
LOCALE.CH = LOCALE.ZH

local function MakeHeader(name, client)
	return { name = name, label = STRINGS[name], options = { { description = "", data = false } }, default = false, client = client }
end

local function GetToggleOptions(name)
	return
	{
		{ description = STRINGS.DISABLED, data = false, hover = STRINGS[name .. "_DISABLED"] },
		{ description = STRINGS.ENABLED, data = true, hover = STRINGS[name .. "_ENABLED"] },
	}
end

local function MakeOption(name, options, default, client)
	return
	{
		name = name,
		label = STRINGS[name],
		hover = STRINGS[name .. "_HOVER"],
		options = options or GetToggleOptions(name),
		default = default or false,
		client = client,
	}
end

local function SetLocale(locale, env)
	STRINGS = locale ~= nil and LOCALE[locale:upper():sub(0, 2)] or LOCALE.EN

	name = STRINGS.NAME
	description = STRINGS.DESCRIPTION_FMT:format(version, version_description)

	local tag = { "NONE", "EPIC", "_HEALTH" }
	for i = 1, #tag do
		local name = "TAG_" .. tag[i]:match("%a+")
		tag[i] = { description = STRINGS[name], data = tag[i], hover = STRINGS[name .. "_HOVER"] }
	end

	local horizontal_offset = {}
	for i = -200, 200, 25 do
		if i < 0 then
			horizontal_offset[#horizontal_offset + 1] = { description = "" .. i, data = i, hover = STRINGS.HORIZONTAL_OFFSET_LEFT:format(-i) }
		elseif i == 0 then
			horizontal_offset[#horizontal_offset + 1] = { description = STRINGS.DISABLED, data = 0, hover = STRINGS.HORIZONTAL_OFFSET_NONE }
		else
			horizontal_offset[#horizontal_offset + 1] = { description = "" .. i, data = i, hover = STRINGS.HORIZONTAL_OFFSET_RIGHT:format(i) }
		end
	end

	local camera = { { description = STRINGS.CAMERA_OPTION, data = true, hover = STRINGS.CAMERA_OPTION_HOVER } }

	local options =
	{
		MakeHeader("HEADER_SERVER"),
		MakeOption("GLOBAL_NUMBERS", nil, false),
		MakeOption("GLOBAL", nil, false),
		MakeOption("CAPTURE", nil, false),
		MakeHeader("HEADER_CLIENT", true),
		MakeOption("TAG", tag, "EPIC", true),
		MakeOption("FRAME_PHASES", nil, true, true),
		MakeOption("DAMAGE_NUMBERS", nil, true, true),
		MakeOption("DAMAGE_RESISTANCE", nil, true, true),
		MakeOption("WETNESS_METER", nil, false, true),
		MakeOption("HORIZONTAL_OFFSET", horizontal_offset, 0, true),
		MakeOption("CAMERA", camera, true, true),
		STRINGS.TRANSLATOR and MakeHeader("TRANSLATOR"),
	}

	if configuration_options == nil then
		configuration_options = options
	elseif env ~= nil then
		configuration_options = env.MergeMapsDeep(configuration_options, options)
	end
end

SetLocale(locale)

function SetLocaleMod(env)
	if env.TheNet:IsDedicated() then
		return
	end

	local locale = env.LanguageTranslator.defaultlang or env.TheNet:GetLanguageCode()
	if env.type(locale) == "string" then
		SetLocale(locale, env)
	end

	if env.IsInFrontEnd() then
		return
	end

	if STRINGS.COMMANDS then
		for name, alias in env.pairs(STRINGS.COMMANDS) do
			local data = env.require("usercommands").GetCommandFromName(name)
			data.displayname = alias
			data.aliases[#data.aliases + 1] = alias
			env.AddUserCommand(name, data)
		end
	end
	if STRINGS.LOADING_TIPS then
		local tab = { username = env.TheNet:GetLocalUserName() }
		for id, tip in env.pairs(STRINGS.LOADING_TIPS) do
			local category = "LOADING_SCREEN_" .. id:match("%a+") .. "_TIPS"
			local key = "EPICHEALTHBAR" .. (id:match("%d+") or "")
			env.AddLoadingTip(env.STRINGS.UI[category], key, env.subfmt(tip, tab))
		end
	end
end