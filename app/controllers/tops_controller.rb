class TopsController < ApplicationController
  def index
    @demands = Service.includes(:area).where(work: 0).order(created_at: :desc).limit(4)
    @supplies = Service.includes(:area).where(work: 1).order(created_at: :desc).limit(4)
    #仮配置
    @category_service = Category.includes(:services).find(2)
  end
end
