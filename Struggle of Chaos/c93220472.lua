--グランド・ドラゴン
--Grand Dragon
local s,id=GetID()
function s.initial_effect(c)
	--atklimit
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_CANNOT_ATTACK)
	e2:SetCondition(s.atkcon)
	c:RegisterEffect(e2)
end
function s.sumcon(e)
	return Duel.GetFieldGroupCount(e:GetHandlerPlayer(),LOCATION_MZONE,0)>0
end
function s.atkcon(e)
	return not Duel.IsExistingMatchingCard(aux.FilterFaceupFunction(Card.IsRace,RACE_DRAGON),e:GetHandlerPlayer(),LOCATION_MZONE,0,1,e:GetHandler())
end
