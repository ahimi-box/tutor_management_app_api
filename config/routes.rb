Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 追加
  namespace :api do
    namespace :v1 do
      # api test action
      resources :hello, only:[:index]
<<<<<<< HEAD
      mount_devise_token_auth_for 'Student', at: 'auth'

      mount_devise_token_auth_for 'Teacher', at: 'teacher_auth'
      # as :teacher do
        # Define routes for Teacher within this block.
      # end
=======
>>>>>>> d683ff330070dad4b1430996fd8218a72f3c94bd
    end
  end
end
