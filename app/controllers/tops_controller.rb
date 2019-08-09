class TopsController < ApplicationController
  def index
    @demands = Service.includes(:area).with_contract(0).recent(4)
    @supplies = Service.includes(:area).with_contract(1).recent(4)
    #仮配置
    @category_service = Category.includes(:services).find(2)
  end
end
