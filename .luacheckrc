color = true
exclude_files = { ".*/", "embeds", "config/" }
max_line_length = false
ignore = { "212", "431", "432" } -- ignore upvalue shadowing
globals = {
	"MultiBarBottomLeft",
	"Details",
	"TalkingHeadFrame",
	"StanceBarFrame",
	"ExtraActionBarFrame",
	"MultiBarRight",
	"PossessBarFrame",
	"CHAT_GUILD_GET",
	"CHAT_OFFICER_GET",
	"CHAT_RAID_GET",
	"CHAT_RAID_WARNING_GET",
	"CHAT_RAID_LEADER_GET",
	"CHAT_PARTY_GET",
	"CHAT_PARTY_LEADER_GET",
	"CHAT_PARTY_GUIDE_GET",
	"CHAT_INSTANCE_CHAT_GET",
	"CHAT_INSTANCE_CHAT_LEADER_GET",
	"CHAT_WHISPER_INFORM_GET",
	"CHAT_WHISPER_GET",
	"CHAT_BN_WHISPER_GET",
	"CHAT_BN_WHISPER_INFORM_GET",
	"CHAT_SAY_GET",
	"CHAT_YELL_GET",
	"CHAT_FLAG_AFK",
	"CHAT_FLAG_DND",
	"CHAT_FLAG_GM",
	"FloatingChatFrame_OnMouseScroll",
	"createStatusbar",
	"SLASH_TOGGLE1",
	"SLASH_RELOADUI1",
	"SlashCmdList",
	"PetCastingBarFrame",
	"SHOW_MULTI_ACTIONBAR_1",
	"SHOW_MULTI_ACTIONBAR_2",
	"SHOW_MULTI_ACTIONBAR_3",
	"SHOW_MULTI_ACTIONBAR_4",
	"SLASH_ALIGN1",
	"sInterface_userConfig"
}
read_globals = {
	"AtlasLootTooltip",
	"C_NamePlate",
	"C_Timer",
	"CompactRaidFrameManager",
	"CreateFrame",
	"FACTION_BAR_COLORS",
	"GameTooltip",
	"GameTooltipHeaderText",
	"GameTooltipStatusBar",
	"GameTooltipText",
	"GetCVarDefault",
	"GetGuildInfo",
	"GetItemInfo",
	"GetMouseFocus",
	"GetNumGroupMembers",
	"GetQuestDifficultyColor",
	"GetRaidRosterInfo",
	"GetSpellInfo",
	"GetThreatStatusColor",
	"InCombatLockdown",
	"IsAddOnLoaded",
	"ItemRefTooltip",
	"MiniMapMailBorder",
	"MiniMapMailFrame",
	"MiniMapTracking",
	"MiniMapTrackingBackground",
	"MiniMapTrackingButton",
	"Minimap",
	"MinimapBorder",
	"MinimapBorderTop",
	"MinimapNorthTag",
	"MinimapZoneText",
	"MinimapZoneTextButton",
	"MinimapZoomIn",
	"NamePlatePlayerResourceFrame",
	"ObjectiveTrackerFrame",
	"OrderHallCommandBar",
	"QuestGuru_QuestWatchTooltip",
	"QuestHelperTooltip",
	"RAID_CLASS_COLORS",
	"RAID_TARGET_ICON",
	"SetCVar",
	"ShoppingTooltip1",
	"ShoppingTooltip2",
	"ShoppingTooltip3",
	"ToggleDropDownMenu",
	"Tooltip_Small",
	"UIFrameFadeIn",
	"UIFrameFadeOut",
	"UIParent",
	"UnitAffectingCombat",
	"UnitCanAttack",
	"UnitCastingInfo",
	"UnitClass",
	"UnitCreatureType",
	"UnitExists",
	"UnitFrame_OnEnter",
	"UnitFrame_OnLeave",
	"UnitHealth",
	"UnitHealthMax",
	"UnitInParty",
	"UnitInRaid",
	"UnitIsConnected",
	"UnitIsDead",
	"UnitIsFriend",
	"UnitIsGhost",
	"UnitIsPlayer",
	"UnitIsUnit",
	"UnitLevel",
	"UnitEffectiveLevel",
	"UnitName",
	"UnitPower",
	"UnitPowerMax",
	"UnitRace",
	"UnitThreatSituation",
	"WorldFrame",
	"WorldMapCompareTooltip1",
	"WorldMapCompareTooltip2",
	"WorldMapCompareTooltip3",
	"WorldMapTooltip",
	"hooksecurefunc",
	"unpack",
	"ItemRefShoppingTooltip1",
	"ItemRefShoppingTooltip2",
	"ItemRefShoppingTooltip3",
	"MAX_PLAYER_LEVEL",
	"IsXPUserDisabled",
	"ToggleRaidFrame",
	"strmatch",
	"GetTime",
	"GetSpellCooldown",
	"GetSpellCharges",
	"NUM_CHAT_WINDOWS",
	"NUM_STANCE_SLOTS",
	"NUM_POSSESS_SLOTS",
	"IsShiftKeyDown",
	"ChatFrame1",
	"MAX_BOSS_FRAMES",
	"MAX_PARTY_MEMBERS",
	"ChatFrameMenuButton",
	"QuickJoinToastButton",
	"ChatFontNormal",
	"FCF_SetLocked",
	"CHAT_FRAMES",
	"ChatTypeInfo",
	"BUFF_ACTUAL_DISPLAY",
	"DEBUFF_MAX_DISPLAY",
	"BUFF_MAX_DISPLAY",
	"mod",
	"abs",
	"OverrideActionBar",
	"MainMenuBar",
	"MainMenuBarArtFrame",
	"HonorWatchBar",
	"ArtifactWatchBar",
	"ReputationWatchBar",
	"MainMenuBarLeftEndCap",
	"MainMenuBarRightEndCap",
	"OverrideActionBarExpBar",
	"OverrideActionBarExpBarXpL",
	"OverrideActionBarExpBarXpR",
	"StanceBarLeft",
	"StanceBarMiddle",
	"StanceBarRight",
	"MainMenuExpBar",
	"MainMenuBarMaxLevelBar",
	"OverrideActionBarExpBarXpMid",
	"MainMenuXPBarTextureMid",
	"MainMenuXPBarTextureRightCap",
	"MainMenuXPBarTextureLeftCap",
	"ActionBarDownButton",
	"ActionBarUpButton",
	"MainMenuBarPageNumber",
	"NUM_OVERRIDE_BUTTONS",
	"ActionButton1",
	"RegisterStateDriver",
	"PossessButton1",
	"NUM_PET_ACTION_SLOTS",
	"PetActionButton1",
	"PetActionBarFrame",
	"MICRO_BUTTONS",
	"UpdateMicroButtonsParent",
	"StanceButton1",
	"MainMenuBarBackpackButton",
	"MultiBarLeft",
	"MultiBarRightButton7",
	"MultiBarRightButton1",
	"MultiBarLeftButton7",
	"MultiBarLeftButton1",
	"MultiBarBottomRightButton7",
	"MultiBarBottomRightButton1",
	"MultiBarBottomRightButton6",
	"NUM_ACTIONBAR_BUTTONS",
	"ActionButton7",
	"MultiBarBottomLeftButton7",
	"MultiBarBottomRight",
	"MultiBarBottomLeftButton1",
	"UnitGroupRolesAssigned",
	"GetSpecializationRole",
	"GetContainerNumSlots",
	"GetContainerItemLink",
	"UseContainerItem",
	"MerchantFrame",
	"UIDropDownMenu_Initialize",
	"CompactUnitFrameProfiles",
	"StanceStanceBar",
	"issecure",
	"random",
	"UIErrorsFrame",
	"GetScreenWidth",
	"GetScreenHeight",
	"GetSpecialization",
	"ReloadUI",
	"UnitAura",
	"ALTERNATE_POWER_INDEX",
	"GetCreatureDifficultyColor",
	"MinimapZoomOut",
	"MiniMapVoiceChatFrame",
	"LoadAddOn",
	"TimeManagerClockButton",
	"GameTimeFrame",
	"GarrisonLandingPageMinimapButton",
	"MiniMapMailIcon",
	"QueueStatusMinimapButton",
	"QueueStatusMinimapButtonBorder",
	"MiniMapInstanceDifficulty",
	"MiniMapWorldMapButton",
	"OverrideActionBarPowerBar",
	"OverrideActionBarHealthBar",
	"sInterfaceFrame",
	"oUF",
	"UnitPopup_ShowMenu",
	"oUF_sInterfacePet",
	"oUF_sInterfacePlayer",
	"oUF_sInterfacePet",
	"oUF_sInterfacePet",
	"oUF_sInterfacePet",
	"MAX_REPUTATION_REACTION",
	"GetWatchedFactionInfo",
	"GetFriendshipReputation",
	"C_Reputation",
	"GetText",
	"UnitSex",
	"GetNumFactions",
	"GetWatchedFactionInfo",
	"GetRestrictedAccountData",
	"IsWatchingHonorAsXP",
	"UnitHonor",
	"UnitXP",
	"UnitHonorMax",
	"UnitXPMax",
	"getCurrentExpereience",
	"GetHonorExhaustion",
	"GetXPExhaustion",
	"C_ArtifactUI",
	"HasArtifactEquipped",
	"UnitHasVehicleUI",
	"MainMenuBar_GetNumArtifactTraitsPurchasableFromXP",
	"GetItemQualityColor",
	"PARAGON",
	"InterfaceOptions_UpdateMultiActionBars",
	"MultiActionBar_Update",
	"UnitHonorLevel",
	"GameFontNormal",
	"GameFontNormalOutline",
	"MainMenuBarArtFrameBackground",
	"MicroButtonAndBagsBar",
	"StatusTrackingBarManager",
	"AuraUtil",
	"NamePlateDriverFrame",
	"SmallTextTooltip",
	"ChatFrameToggleVoiceMuteButton",
	"ChatFrameToggleVoiceDeafenButton",
	"NameplateBuffContainerMixin",
	"C_AzeriteItem",
	"ARTIFACT_BAR_COLOR",
	"SmallTextTooltip",
	"ChatFrameToggleVoiceDeafenButton",
	"ChatFrameToggleVoiceMuteButton",
	"ChatFrameChannelButton",
	"UnitReaction",
	"PixelUtil",
	"GameTooltipTextLeft4",
	"GameTooltipTextLeft5",
	"BackdropTemplateMixin"
}
