BattlePuzzles::Application.routes.draw do

  devise_for :users

  resources :users, :only => [:index, :show]
  resources :armies
  resources :divisions
  
  get 'army/update_nations', :as => 'update_nations', :to => 'armies#update_nations'
  
  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

end
