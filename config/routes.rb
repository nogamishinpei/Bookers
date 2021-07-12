Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, :homes
 get 'books/new'

 get 'top' => 'homes#top'
 post 'books'=>'books#create'

 get 'books'=>'books#index'
 get 'books/:id' => 'books#show', as: 'show_book'
 get 'books/:id/edit'=>'books#edit',as: 'editbook'
 patch 'books/:id'=> 'books#update', as: 'update_book'

end