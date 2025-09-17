Rails.application.routes.draw do
  get 'home/index'
  get 'home/contact_us'
  get 'home/careers'
  get 'home/who_we_are'
  resources :blogs, only: [:index, :show]
  namespace :admin do
    resources :blogs do
      member do
        patch :publish
        patch :unpublish
      end
    end
    root to: 'blogs#index'
  end
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
  get 'contact_us', to: 'home#contact_us'
  get 'careers', to: 'home#careers'
  get 'who_we_are', to: 'home#who_we_are'
  get 'blogs', to: 'blogs#index'
end
