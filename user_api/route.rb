# frozen_string_literal: true

class Route
  # config/routes.rb
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
    end
  end
end
