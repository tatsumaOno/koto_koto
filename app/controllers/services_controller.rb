class ServicesController < ApplicationController

  def request #悩み
    @service = Service.new()
  end

  def skills
    @service = Service.new()
  end
end
