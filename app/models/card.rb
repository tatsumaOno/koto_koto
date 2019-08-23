class Card < ApplicationRecord
  belongs_to :user

  def self.create_charge(customer, service)
    Payjp.api_key = ENV["PAYJP_KEY"]
    Payjp::Charge.create(
      amount: service.price,
      customer: customer,
      currency: 'jpy'
    )
  end

  def self.create_customer(user,payjp_token)
    Payjp.api_key = ENV["PAYJP_KEY"]
    @customer = Payjp::Customer.create(
      email: user.email,
      card: payjp_token
    )
  end

  def set_customer
    Payjp.api_key = ENV["PAYJP_KEY"]
    Payjp::Customer.retrieve(self.customer_id)
  end

  def delete_payjp(customer)
    self.destroy
    customer.delete
  end
end
