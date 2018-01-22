Rails.application.routes.draw do



  get 'sessions/new'

  get 'review/view'

  get 'jogo/view'

  get 'conta/view'
  get 'conta/index'
  get 'noticias/view'


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  root 'frontoffice#index'
  get  '/signup',  to: 'conta#new'
  resources :conta
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
