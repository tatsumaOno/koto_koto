class Services::AgreementsController < ApplicationController
	before_action :have_a_card,only: [:create]
	def create
		@service = Service.find(params[:service_id])
		if @card && @service.work == 'supply'
			@customer = Card.set_customer(@card)
			Card.create_charge(@customer,@service)
		end
		@service.contract_status
		Room.create_room(@service,current_user)
		redirect_to root_path
		flash[:success] = "購入が完了しました。チャットルームを作成しましたので、連絡を取り合いましょう"
	end

	def update
		@service = Service.find(params[:service_id])
		@room = Room.find(params[:id]) 
		if @service && @room.activated == true
			@service.contract_status
			@room.change_activated
			redirect_to new_service_evaluate_path(@service)
		else
			redirect_to current_user
		end
	end


private
	def have_a_card
		 @card = Card.find_by(user_id: current_user.id)
		 if @card == nil
			redirect_to current_user
			flash[:danger] = "カードを登録してください"
		 end
	end
end
