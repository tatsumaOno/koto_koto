class CardsController < ApplicationController
	require 'payjp'
	include CardsHelper

	def index
		#メソッド化したい
		@card = Card.find_by(user_id: current_user.id)
		Payjp.api_key = 'sk_test_a15dc8e443d70196461839ca'
		customer = Payjp::Customer.retrieve(@card.customer_id)
		@card_information = customer.cards.retrieve(@card.card_id)
	end

	def new
	end

	def create
		create_customer(current_user)
		@card = Card.new(user_id: current_user.id,customer_id: @customer.id,card_id: @customer.default_card)
		if @card.save
			redirect_to current_user
			flash[:success] = "カード情報を登録しました"
		else
			render :new
			flash[:danger] = "不正な情報です"
		end
	end

	def destroy
	end
end
