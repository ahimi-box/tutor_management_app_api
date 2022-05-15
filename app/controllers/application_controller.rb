class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken
        skip_before_action :verify_authenticity_token, if: :devise_controller?, raise: false
        before_action :configure_permitted_parameters, if: :devise_controller?

        def configure_permitted_parameters
					# 新規登録
					devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
					# アカウント情報更新
					# devise_parameter_sanitizer.permit(:account_update, keys: [:id, :name, :email, :introduction])
        end
end
