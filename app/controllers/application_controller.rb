class ApplicationController < ActionController::Base
  # ユーザー新規登録の項目（カラム）を追加した場合に記述
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource) # ログイン後に遷移するpathを設定
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :group, :prefecture, :introduction])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :group, :prefecture, :introduction]) # アカウント編集の時にカラムを追加
  end
end
