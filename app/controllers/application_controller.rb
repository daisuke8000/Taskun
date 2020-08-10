class ApplicationController < ActionController::Base
# ↓これを追加↓
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  protected

  def after_sign_out_path_for resource
    root_path
  end

  def after_sign_in_path_for(resource)
    users_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def layout_by_resource
    if devise_controller?
      "devise-application"
    else
      "application"
    end
  end
end
