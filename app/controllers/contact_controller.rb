class ContactController < ApplicationController
  def index
    @menus = Menu.get_menus
    @message = Message.new
    @title = 'Liên hệ'
  end
  
  def finish_contact
    @menus = Menu.get_menus
    @title = 'Gửi lời nhắn thành công'
  end
end
