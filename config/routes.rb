Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #default route that the application takes and alias of home for the path
  root 'editor#index', as: 'home'

  #this needs to be above resources to be called correctly.
  post "editor"     => "editor#fileupload"
  #put "editor/new"     => "editor#fileupload"

  #creates most of the paths for the editor class
  resources :editor
  #the one that it didn't make but I needed
  post "editor/new"    => "editor#create"

end
