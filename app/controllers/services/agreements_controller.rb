class Services::AgreementsController < ApplicationController
	def create
		@service = Service.find(params[:service_id])
		@card = Card.find_by(user_id: current_user.id)
		if @card && @service.work == 'supply'
			@customer = Card.set_customer(@card)
			Card.create_charge(@customer,@service)
			@service.contract_status
			redirect_to root_path
			flash[:success] = "購入が完了しました"
		end
	end
end
