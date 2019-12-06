Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        resources :users do
          post :signin, on: :collection
          post :signup, on: :collection
          post :recover_password, on: :collection
        end
        resources :media_histories
        resources :text_to_speech
      end
      namespace :rails do
        resources :active_storage do
          post :direct_uploads, on: :collection
        end
      end
  end
end
