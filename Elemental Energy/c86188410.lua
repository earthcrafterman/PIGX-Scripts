--E・HERO ワイルドマン
--Elemental HERO Wildheart
local s,id=GetID()
function s.initial_effect(c)
	--immune trap
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_IMMUNE_EFFECT)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetValue(s.efilter)
	c:RegisterEffect(e1)
	--extra summon
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetRange(LOCATION_MZONE)
	e2:SetTargetRange(LOCATION_HAND+LOCATION_MZONE,0)
	e2:SetCode(EFFECT_EXTRA_SUMMON_COUNT)
	e2:SetDescription(aux.Stringid(id,0))
	e2:SetTarget(aux.TargetBoolFunction(Card.IsSetCard,0x8))
	c:RegisterEffect(e2)
end
s.listed_series={0x8}
function s.efilter(e,te)
	return te:IsActiveType(TYPE_TRAP) and te:GetHandler():GetControler()~=e:GetHandler():GetControler()
end