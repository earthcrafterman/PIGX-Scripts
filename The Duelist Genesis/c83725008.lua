--ライトロード・プリースト ジェニス
--Lightsworn Priest Janus
local s,id=GetID()
function s.initial_effect(c)
	--discard deck
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e1:SetCategory(CATEGORY_DECKDES+CATEGORY_DRAW)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EVENT_TO_GRAVE)
	e1:SetCondition(s.condtion)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
s.listed_series={0x38}
s.listed_names={id}
function s.cfilter(c)
	return c:IsPreviousLocation(LOCATION_DECK)
end
function s.condtion(e,tp,eg,ep,ev,re,r,rp)
	if not re then return false end
	local rc=re:GetHandler()
	return rp==tp and (r&REASON_EFFECT)~=0 and not rc:IsCode(id) and rc:IsSetCard(0x38)
		and re:GetActivateLocation()==LOCATION_MZONE and eg:IsExists(s.cfilter,1,nil)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetOperationInfo(0,CATEGORY_DECKDES,nil,0,tp,2)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:GetControler()~=tp or not c:IsRelateToEffect(e) or c:IsFacedown() then return end
	local ct=eg:FilterCount(s.cfilter,nil)
	if ct>0 then
		Duel.Damage(1-tp,500*ct,REASON_EFFECT)
		Duel.BreakEffect()
		Duel.Recover(tp,500*ct,REASON_EFFECT)
	end
end
