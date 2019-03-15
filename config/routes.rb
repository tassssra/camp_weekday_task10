Rails.application.routes.draw do
  root 'areas#index'
  get 'areas/search' => 'areas#search'
end
