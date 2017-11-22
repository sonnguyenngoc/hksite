class AboutUsController < ApplicationController
  def index
    @menus = Menu.get_menus
    @title = 'Giới thiệu'
  end
end
