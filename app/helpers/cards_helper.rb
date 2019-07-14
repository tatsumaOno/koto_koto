module CardsHelper
	def create_customer(user)
		Payjp.api_key = 'sk_test_a15dc8e443d70196461839ca'
		@customer =	Payjp::Customer.create(
						email: current_user.email,
						card: params['payjp-token']
					)
	end
	
	def card_present?
		current_user.cards.present?
	end
end
