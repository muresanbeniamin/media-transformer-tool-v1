Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        resources :users do
          post :signin, on: :collection
          post :signup, on: :collection
          post :recover_password, on: :collection
        end
        resources :media_histories, only: [:index, :create]
        resources :text_to_speech
      end
  end
end
