class CommentsController < ApplicationController
	before_action :get_service,only: [:create]
	def create
		@comment = Comment.new(new_comment)
		if @comment.save
			flash[:success] = "コメントしました"
			redirect_to @service
		else
			flash[:danger] = "コメントできませんでした"
			redirect_back(fallback_location: service_path(@service))
		end
	end

  private
  
	def get_service
		@service = Service.find(params[:service_id])
	end
	  
	def new_comment
		params.require(:comment).permit(:detail).merge(user_id: current_user.id,service_id: @service.id)
	end
end
