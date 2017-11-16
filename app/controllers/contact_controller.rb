class ContactController < ApplicationController
  def index
    @menus = Menu.get_menus
    @message = Message.new
  end
  
  def finish_contact
    @menus = Menu.get_menus
  end
end
