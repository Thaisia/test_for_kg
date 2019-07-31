Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index', as: 'home'
  get 'import' => 'imports#import', as: 'import'
  post 'import_xml' => 'imports#import_xml', as: 'import_xml'

  resources :items
  resources :categories

end
