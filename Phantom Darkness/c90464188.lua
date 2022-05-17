--黒曜岩竜
--Obsidian Dragon
local s,id=GetID()
function s.initial_effect(c)
	--cannot be target
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_CANNOT_BE_EFFECT_TARGET)
	e1:SetRange(LOCATION_MZONE)
	e1:SetProperty(EFFECT_FLAG_IGNORE_IMMUNE)
	e1:SetTargetRange(LOCATION_MZONE,0)
	e1:SetTarget(s.etarget)
	e1:SetValue(aux.tgoval)
	c:RegisterEffect(e1)
end
function s.etarget(e,c)
	return c:IsAttribute(ATTRIBUTE_DARK)
end