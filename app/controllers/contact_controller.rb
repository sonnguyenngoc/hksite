class ContactController < ApplicationController
  def index    
    @message = Message.new
  end
  
  def finish_contact
  end
end
