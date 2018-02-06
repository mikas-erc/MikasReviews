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
  get '/noticias', to: 'frontoffice#noticias_index', as: 'fnoticias_index'
  get '/contas', to: 'frontoffice#contas_index', as: 'fcontas_index'
  get '/signup', to: 'frontoffice#new_conta'
  post '/createaccount', to: 'frontoffice#create_conta'
  root 'frontoffice#index'
  get '/backoffice', to: 'backoffice#index', as: 'backhome'
  resources :account_activations, only: [:edit]


  scope 'backoffice/' do
    resources :jogo
    resources :noticia
    resources :conta
    get '/conta/edit_password/:id', to: 'conta#edit_password', as: 'editcontapassword'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
