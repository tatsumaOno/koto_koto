module CardsHelper
	
	def create_customer(user)
		Payjp.api_key = ENV["PAYJP_KEY"]
		@customer =	Payjp::Customer.create(
				email: user.email,
				card: params['payjp-token']
		)
	end

	def expiration_date(card_infomation)
		"#{card_infomation.exp_month}/#{card_infomation.exp_year}"
	end
	
	def card_present?
		current_user.cards.present?
	end
end
