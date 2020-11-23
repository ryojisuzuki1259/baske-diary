class ApplicationController < ActionController::Base
  # ユーザー新規登録の項目（カラム）を追加した場合に以下を記述する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :group, :prefecture, :introduction])
  end
end
