Rails.application.routes.draw do
  devise_for :students, module: :students
  devise_for :teachers, module: :teachers
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 追加
  namespace :api do
    namespace :v1 do
      # api test action
      resources :hello, only:[:index]
      resources :teachers, only:[:index, :update, :destroy]
      resources :students, only:[:index, :update, :destroy]
      mount_devise_token_auth_for 'Student', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      mount_devise_token_auth_for 'Teacher', at: 'teacher_auth', controllers: {
        registrations: 'api/v1/teacher_auth/registrations'
      }
      # as :teacher do
        # Define routes for Teacher within this block.
      # end
    end
  end
end
