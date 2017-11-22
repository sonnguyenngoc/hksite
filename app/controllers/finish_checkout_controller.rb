class FinishCheckoutController < ApplicationController
  def index
    @menus = Menu.get_menus
    @title = 'Đặt hàng thành công'
  end
end
