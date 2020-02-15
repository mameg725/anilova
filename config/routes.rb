Rails.application.routes.draw do

  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
  }

  devise_for :owners, controllers: {
  sessions:      'owners/sessions',
  passwords:     'owners/passwords',
  registrations: 'owners/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "public/posts#index"

  scope module: "public" do
    resources :users, only: [:mypage, :show, :favoindex, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get "follows" => "relationships#follower", as: "follows"
      get "followers" => "relationships#followed", as: "followers"
    end
    get "users/mypage/:id" => "users#mypage", as: "users_mypage"
    get "users/favoindex/:id" => "users#favoindex", as: "users_favoindex"

    resources :posts, only: [:index, :show, :create, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resource :post_comments, only: [:create, :destroy]
    end

    resources :newss, only: [:index, :show]
    resources :searches, only: [:search]
    get "searches/search" => "searches#search"

    resources :notices, only: [:index]
  end

  namespace :admin do
    resources :users, only: [:top, :index, :show]
    get "users/top" => "users#top"

    resources :messages, only: [:index, :show, :create, :destroy]
    resources :newss, only: [:index, :show, :create, :destroy]

    resources :posts, only: [:index, :show, :destroy] do
      resource :post_comments, only: [:destroy]
    end

    resources :searches, only: [:search]
    get "searches/search" => "searches#search"
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end