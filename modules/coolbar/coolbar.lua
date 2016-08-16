local _, ns = ...
local E, C = ns.E, ns.C

local CoolBar = CreateFrame("Frame", "CoolBar", UIParent)

local tick0, tick1, tick2, tick3, tick4, tick5, tick6 = 0, 1, 3, 10, 30, 120, 360
local segment
local cooldowns = {}
local active = 0

local function fs(frame, text, offset, just)
	local fs = E:FontString({parent=frame, justify=just})
	if (text > 60) then text = (text/60).."m" end
	fs:SetText(text)
	fs:SetPoint("LEFT", offset, 0)
end

function CoolBar:PLAYER_LOGIN()
	CoolBar:SetFrameStrata("BACKGROUND")
	CoolBar:SetHeight(C.coolbar.height)
	CoolBar:SetWidth(C.coolbar.width)
	CoolBar:SetPoint(unpack(C.coolbar.pos))

	CoolBar.bg = CoolBar:CreateTexture(nil, "ARTWORK")
	CoolBar.bg:SetTexture(C.general.texture)
	CoolBar.bg:SetVertexColor(0.2, 0.2, 0.2, 0.5)
	CoolBar.bg:SetAllPoints(CoolBar)

	CoolBar:SetAlpha(C.coolbar.oocTransparency)
	CoolBar:Hide()

	E:ShadowedBorder(CoolBar)

	segment = CoolBar:GetWidth() / 7

	CoolBar.fontLayer = CreateFrame("Frame", nil, CoolBar)
	CoolBar.fontLayer:SetAllPoints(CoolBar)
	CoolBar.fontLayer:SetFrameLevel(128)

	fs(CoolBar.fontLayer, tick0, 4, "LEFT")
	fs(CoolBar.fontLayer, tick1, segment, "CENTER")
	fs(CoolBar.fontLayer, tick2, segment* 2, "CENTER")
	fs(CoolBar.fontLayer, tick3, segment * 3, "CENTER")
	fs(CoolBar.fontLayer, tick4, segment * 4, "CENTER")
	fs(CoolBar.fontLayer, tick5, segment * 5, "CENTER")
	fs(CoolBar.fontLayer, tick6, (segment * 6) + 6, "RIGHT")

	E:RegisterHideAnimation(CoolBar)
	E:RegisterRevealAnimation(CoolBar, 0.6)
end

function CoolBar:CreateCooldown(spellId)
	local start, dur, enabled = GetSpellCooldown(spellId)
	if (dur < 2) then return end --probably GCD

	local f

	for index, frame in pairs(cooldowns) do
		if frame.spellId == spellId then
			f = frame
			break
		end
	end

	if not f then
		local _, _, icon, _ = GetSpellInfo(spellId)
		f = CreateFrame("Frame", nil, CoolBar)
		f.spellId = spellId
		f.icon = f:CreateTexture(nil, "ARTWORK")
		f.icon:SetTexture(icon)
		f.icon:SetAllPoints(f)
		f.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

		f.finishAnimation = f:CreateAnimationGroup()
		f.finishAnimation.scaleUp = f.finishAnimation:CreateAnimation("Scale")
		f.finishAnimation.scaleUp:SetFromScale(1, 1)
		f.finishAnimation.scaleUp:SetToScale(4, 4)
		f.finishAnimation.scaleUp:SetDuration(0.3)
		f.finishAnimation.scaleUp:SetSmoothing("OUT")
		f.finishAnimation.scaleUp:SetEndDelay(0.8)
		f.finishAnimation.alphaOut = f.finishAnimation:CreateAnimation("Alpha")
		f.finishAnimation.alphaOut:SetFromAlpha(1)
		f.finishAnimation.alphaOut:SetToAlpha(0)
		f.finishAnimation.alphaOut:SetDuration(0.6)
		f.finishAnimation:HookScript("OnFinished", function() 
			f:Hide()
		end)

		f.failAnimation = f:CreateAnimationGroup()
		f.failAnimation.scaleUp = f.failAnimation:CreateAnimation("Scale")
		f.failAnimation.scaleUp:SetFromScale(1, 1)
		f.failAnimation.scaleUp:SetToScale(3, 3)
		f.failAnimation.scaleUp:SetDuration(0.3)
		f.failAnimation.scaleUp:SetSmoothing("OUT")
		f.failAnimation.scaleUp:SetEndDelay(0.1)

		f.failAnimation.alphaOut = f.failAnimation:CreateAnimation("Alpha")
		f.failAnimation.alphaOut:SetFromAlpha(1)
		f.failAnimation.alphaOut:SetToAlpha(0)
		f.failAnimation.alphaOut:SetDuration(0.2)
		f.failAnimation.alphaOut:SetOrder(2)
		f.failAnimation.scaleDown = f.failAnimation:CreateAnimation("Scale")
		f.failAnimation.scaleDown:SetFromScale(1, 1)
		f.failAnimation.scaleDown:SetToScale(0.33, 0.33)
		f.failAnimation.scaleDown:SetDuration(0.2)
		f.failAnimation.scaleDown:SetOrder(2)

		f.failAnimation.alphaIn = f.failAnimation:CreateAnimation("Alpha")
		f.failAnimation.alphaIn:SetToAlpha(1)
		f.failAnimation.alphaIn:SetDuration(0.2)
		f.failAnimation.alphaIn:SetOrder(3)

		table.insert(cooldowns, f)
	end

	f.finishAnimation:Stop()
	f.endTime = start + dur
	f:SetHeight(CoolBar:GetHeight()*1.5)
	f:SetWidth(CoolBar:GetHeight()*1.5)
	f:SetAlpha(1)
	active = active + 1
	CoolBar.hideAnimation:Stop()
	if not CoolBar:IsShown() then
		CoolBar.revealAnimation:Play()
	end

	f.ticker = C_Timer.NewTicker(0.01, function(self)
		local start, dur, enabled = GetSpellCooldown(f.spellId)
		if f.endTime > start + dur then
			f.endTime = start + dur
		end

		local gameTime = GetTime()
		local remain = f.endTime - gameTime
		if gameTime >= f.endTime then
			f.ticker:Cancel()
			f.finishAnimation:Play()
			active = active - 1
			if active == 0 then
				CoolBar.hideAnimation:Play()
			end
			return
		end	

		if remain < tick1 then
			f:SetPoint("CENTER", CoolBar, "LEFT", segment * remain, 0)
			if remain < 0.2 and not f.finishAnimation:IsPlaying() then
				f.failAnimation:Stop()
				f.finishAnimation:Play()
			end
		elseif remain < tick2 then
			f:SetPoint("CENTER", CoolBar, "LEFT", ((0.5 * remain) + 0.5)*segment, 0)
		elseif remain < tick3 then
			f:SetPoint("CENTER", CoolBar, "LEFT", ((0.14285714 * remain) + 1.5714285)*segment, 0)
		elseif remain < tick4 then
			f:SetPoint("CENTER", CoolBar, "LEFT", ((0.05 * remain) + 2.5)*segment, 0)
		elseif remain < tick5 then
			f:SetPoint("CENTER", CoolBar, "LEFT", ((0.01111112 * remain) + 3.666665)*segment, 0)
		else
			f:SetPoint("CENTER", CoolBar, "LEFT", CoolBar:GetWidth(), 0)
		end

		if (random() > .98) then
			f:SetFrameLevel(random(1,5) * 2 + 2)
		end
	end, dur/0.01)

	C_Timer.After(0.01, function(self)
		f:Show()
	end)
end

function CoolBar:UNIT_SPELLCAST_SUCCEEDED(unitId, spell, _, _, spellId)
	if unitId == "player" or unitId == "vehicle" and not C.coolbar.disabled[spell] then
		local timer = C_Timer.After(0.1, function()
			CoolBar:CreateCooldown(spellId)
		end)
	end
end

function CoolBar:UNIT_SPELLCAST_FAILED(unitId, _, _, _, spellId)
	if not (unitId == "player") then return end
	local f
	for index, frame in pairs(cooldowns) do
		if frame.spellId == spellId then
			f = frame
			break
		end
	end
	if not f then return end

	if not f.finishAnimation:IsPlaying() then
		f.failAnimation:Stop()
		f.failAnimation:Play()
	end
end

function CoolBar:PLAYER_REGEN_DISABLED()
	CoolBar:SetAlpha(1)
end

function CoolBar:PLAYER_REGEN_ENABLED()
	CoolBar:SetAlpha(C.coolbar.oocTransparency)
end

CoolBar:SetScript("OnEvent", function(this, event, ...)
	this[event](this, ...)
end)
for k, v in pairs(CoolBar) do
	if (k  == string.upper(k)) then
		CoolBar:RegisterEvent(k)
	end
end