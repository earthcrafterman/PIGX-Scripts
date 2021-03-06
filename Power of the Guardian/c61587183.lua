--黒蠍－逃げ足のチック
--Dark Scorpion - Chick the Escaper
local s,id=GetID()
function s.initial_effect(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetCategory(CATEGORY_TOHAND)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_TRIGGER_O)
	e1:SetCode(EVENT_BATTLE_DAMAGE)
	e1:SetCondition(s.condition)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.condition(e,tp,eg,ep,ev,re,r,rp)
	return ep~=tp
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsOnField() and chkc:IsAbleToHand() end
	if chk==0 then return Duel.IsPlayerCanDiscardDeck(1-tp,5)
		or Duel.IsExistingTarget(Card.IsAbleToHand,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,nil) end
	local op=0
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(id,0))
	if Duel.IsExistingTarget(Card.IsAbleToHand,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,nil)
		and Duel.IsPlayerCanDiscardDeck(1-tp,5) then
		op=Duel.SelectOption(tp,aux.Stringid(id,1),aux.Stringid(id,2))
	elseif Duel.IsPlayerCanDiscardDeck(1-tp,5) then
		Duel.SelectOption(tp,aux.Stringid(id,2))
		op=1
	else
		Duel.SelectOption(tp,aux.Stringid(id,1))
		op=0
	end
	e:SetLabel(op)
	if op==0 then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_RTOHAND)
		local g=Duel.SelectTarget(tp,Card.IsAbleToHand,tp,LOCATION_ONFIELD,LOCATION_ONFIELD,1,1,nil)
		Duel.SetOperationInfo(0,CATEGORY_TOHAND,g,1,0,0)
		e:SetProperty(EFFECT_FLAG_CARD_TARGET)
	else e:SetProperty(0) end
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	if e:GetLabel()==0 then
		local tc=Duel.GetFirstTarget()
		if tc and tc:IsRelateToEffect(e) then
			Duel.SendtoHand(tc,nil,REASON_EFFECT)
		end
	else
		Duel.DiscardDeck(1-tp,5,REASON_EFFECT)
	end
end
