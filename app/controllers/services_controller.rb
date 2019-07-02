class ServicesController < ApplicationController

  def demand #悩み
    @service = Service.new()
  end

  def supply
    @service = Service.new()
  end
end
