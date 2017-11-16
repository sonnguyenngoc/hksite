class FinishCheckoutController < ApplicationController
  def index
    @menus = Menu.get_menus
  end
end
