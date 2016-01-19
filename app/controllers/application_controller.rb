class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  
  def layout_by_resource
    if controller_name == 'home' || controller_name == 'category' || controller_name == 'blog' || controller_name == 'blog_post' ||
       controller_name == 'contact' || controller_name == 'about_us'
      'frontend'
    elsif controller_name == 'manages' || controller_name == 'messages' || controller_name == 'newsletters' ||
          controller_name == 'tags' || controller_name == 'articles' || controller_name == 'slide_shows'
      'backend'
    end
  end
end
