module CardsHelper
  def expiration_date(card_infomation)
    "#{card_infomation.exp_month}/#{card_infomation.exp_year}"
  end

  def card_present?
    current_user.cards.present?
  end
end
