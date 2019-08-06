class Rooms::EvaluatesController < ApplicationController
	def new
		@room = Room.find(params[:room_id])
	end

	def create
		
	end
end