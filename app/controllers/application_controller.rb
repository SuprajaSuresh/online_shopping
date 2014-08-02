class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_path(resource) : user_path(resource)
  end
  def after_sign_out_path_for(resource)
    root_path
  end
  
end
