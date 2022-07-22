Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :specialties, only: %i[index create show update destroy]
    end
  end
end
