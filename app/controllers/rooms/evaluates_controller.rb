class Rooms::EvaluatesController < ApplicationController
	 def new
 		 @room = Room.find(params[:room_id])
 	end

	 def create
 		 @room = Room.find(params[:room_id])
 		 if @rated_user = User.find_by(id: @room.rated_user)
  			 @rated_user.place_value(params[:support], params[:satisfaction])
  			 @rated_user.create_confidence_score
  			 @rated_user.create_point
  			 redirect_to root_path
  			 flash[:success] = "評価できました。"
  		else
  			 render :new
  		end
 	end
end