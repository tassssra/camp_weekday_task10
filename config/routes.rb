Rails.application.routes.draw do
  root 'areas#index'
  post 'areas' => 'areas#create'
  get 'areas/search' => 'areas#search'
  post 'areas/search' => 'areas#form'
end
