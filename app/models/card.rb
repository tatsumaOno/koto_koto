class Card < ApplicationRecord
	belongs_to :user

	def self.set_customer(card)
		Payjp.api_key = ENV["PAYJP_KEY"]
		Payjp::Customer.retrieve(card.customer_id)
	end

	def self.create_charge(customer,service)
		Payjp.api_key = ENV["PAYJP_KEY"]
		Payjp::Charge.create(
			:amount => service.price,
			:customer => customer,
			:currency => 'jpy',
		)
	end

	def delete_payjp(customer)
		self.destroy
		customer.delete
	end
end
