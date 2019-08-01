class Services::AgreementsController < ApplicationController
	def create
		@service = Service.find(params[:service_id])
		@card = Card.find_by(user_id: current_user.id)
		if @card && @service.work == 'supply'
			@customer = Card.set_customer(@card)
			Card.create_charge(@customer,@service)
		end
		@service.contract_status
		Room.create_room(@service,current_user)
		redirect_to root_path
		flash[:success] = "購入が完了しました。チャットルームを作成しましたので、連絡を取り合いましょう"
	end
end
