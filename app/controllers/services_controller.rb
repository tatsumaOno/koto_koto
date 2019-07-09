class ServicesController < ApplicationController
  before_action :logged_in_user,only: [:demand,:demand_create,:supply,:supply_create,:show,:edit,:update] 
  before_action :correct_user,only: [:demand,:demand_create,:supply,:supply_create,:edit,:update]
  before_action :find_service,only: [:show,:edit,:update]

  def demand #悩み
    @service = Service.new()
  end

  def demand_create
    @service = Service.new(service_params)
    if @service.save
      flash[:success] = "出品が完了しました"
      redirect_to @user
    else
      render :demand
    end
  end

  def supply
    @service = Service.new()
  end

  def supply_create
    @service = Service.new(service_params)
    if @service.save
      flash[:success] = "出品が完了しました"
      redirect_to @user
    else
      render :supply
    end
  end

  def show 
  end

  def edit
  end


private
    def find_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:image,:title,:detail,:price,:time,:work,:area_id,:category_id).merge(user_id: current_user.id)
    end
end
