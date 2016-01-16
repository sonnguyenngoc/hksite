class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  
  def layout_by_resource
    if controller_name == 'home' || controller_name == 'category'
      'frontend'
    end
  end
end
