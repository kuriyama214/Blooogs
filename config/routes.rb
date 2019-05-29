Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show,:edit,:update]
  resources :articles do
    collection do
      get 'search'
      get 'ranking'
      get  '/:id/archives/:yyyymm', to: 'articles#archives', as: :article_archive
    end
  end  
  root "articles#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
