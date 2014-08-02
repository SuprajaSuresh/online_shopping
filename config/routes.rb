OnlineShopping::Application.routes.draw do

  devise_for :admins, :controllers => { :sessions => :sessions }
  devise_for :users, :controllers => { :sessions => :sessions }

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :users do
    resources :purchases
  end
  resources :admins
  resources :categories
  resources :products do
    resources :purchases
  end
  resources :purchases do
    collection do
      put :checkout_products
    end
  end

  match "/admin" => redirect("/admins/signin")

end
