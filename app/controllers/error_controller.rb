class ErrorController < ApplicationController
  layout 'error_page'
  
  def not_found
    render(:status => 404)
  end
end
