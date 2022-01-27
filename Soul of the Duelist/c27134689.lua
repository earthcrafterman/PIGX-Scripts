--マスター・オブ・OZ
--Master of Oz
local s,id=GetID()
function s.initial_effect(c)
	--fusion material
	c:EnableReviveLimit()
	Fusion.AddProcMixN(c,false,false,aux.FilterBoolFunctionEx(Card.IsRace,RACE_BEAST),1,aux.AND(aux.FilterBoolFunctionEx(Card.IsRace,RACE_BEAST),aux.FilterBoolFunctionEx(Card.IsLevelAbove,7)))
	Fusion.AddContactProc(c,s.contactfil,s.contactop,nil,nil,SUMMON_TYPE_FUSION)
end
function s.contactfil(tp)
	return Duel.GetMatchingGroup(Card.IsAbleToGraveAsCost,tp,LOCATION_ONFIELD,0,nil)
end
function s.contactop(g)
	Duel.SendtoGrave(g,REASON_COST+REASON_MATERIAL)
end