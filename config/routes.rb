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

  get '/jogos', to: 'frontoffice#jogos_index', as: 'fjogos_index'
  root 'frontoffice#index'
  get '/backoffice', to: 'backoffice#index', as: 'backhome'

  scope 'backoffice/' do
    resources :jogo
    resources :noticia
  end


  get  '/signup',  to: 'conta#new'
  resources :conta
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
