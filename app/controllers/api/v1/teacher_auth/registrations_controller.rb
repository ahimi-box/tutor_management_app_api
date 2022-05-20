# class Api::V1::TeacherAuth::RegistrationsController < ApplicationController
# end
class Api::V1::TeacherAuth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include DeviseTokenAuth::Concerns::SetUserByToken
	skip_before_action :verify_authenticity_token, if: :devise_controller?, raise: false
	before_action :configure_sign_up_params, if: :devise_controller?
  # include DeviseTokenAuth::Concerns::SetUserByToken
  # skip_before_action :verify_authenticity_token< ApplicationController
  before_action :configure_sign_up_params, only: [:create] 

  def create
    super
  end

  protected

  def configure_sign_up_params
		# byebug
		# 新規登録
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
		# アカウント情報更新
		# devise_parameter_sanitizer.permit(:account_update, keys: [:id, :name, :email, introduction])
	end
end