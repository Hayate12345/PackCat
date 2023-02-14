class ApplicationController < ActionController::Base

  # ! 会員登録時に名前も登録するための設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
