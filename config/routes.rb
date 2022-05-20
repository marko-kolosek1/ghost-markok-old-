Rails.application.routes.draw do
  resources :users, only: [:index, :show, :edit, :update]
  devise_for :users, :controllers => { :registrations => 'registrations' }, :path => 'accounts', :path_names => { :sign_in => 'login', :sign_up => 'new', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification' }

  root 'home#homepage'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
