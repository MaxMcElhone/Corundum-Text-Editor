Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'editor#index'
  resources :editor
  post "editor/new"    => "editor#create"
end
