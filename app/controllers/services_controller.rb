class ServicesController < ApplicationController
  before_action :logged_in_user,only: [:demand,:create] 
  before_action :correct_user,only: [:demand,:supply,:create]

  def demand #悩み
    @service = Service.new()
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      flash[:success] = "出品が完了しました"
      redirect_to @user
    end
  end

  def supply
    @service = Service.new()
  end



private
    def service_params
      params.require(:service).permit(:image,:title,:detail,:price,:time,:work).merge(user_id: current_user.id)
    end
end
