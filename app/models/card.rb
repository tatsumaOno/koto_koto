class Card < ApplicationRecord
	belongs_to :user

	def self.set_customer(card)
		Payjp.api_key = 'sk_test_a15dc8e443d70196461839ca'
		Payjp::Customer.retrieve(card.customer_id)
	end

	def delete_payjp(customer)
		self.destroy
		customer.delete
	end
end
