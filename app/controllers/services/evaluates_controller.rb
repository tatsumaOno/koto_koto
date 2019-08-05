class Services::EvaluatesController < ApplicationController
	def new
		@service = Service.find(params[:service_id])
	end
end