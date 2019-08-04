class CardsController < ApplicationController
	before_action :set_payjp,only: [:index,:destroy]
	include CardsHelper

	def index
		@card_information = @customer.cards.retrieve(@card.card_id)
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
		if @card.delete_payjp(@customer)
			redirect_to user_path(current_user.id)
			flash[:danger] = "カード情報を削除しました"
		end
	end

private
	def set_payjp
		@card = Card.find_by(user_id: current_user.id)
		@customer = Card.set_customer(@card)
	end
end
