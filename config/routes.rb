  Rails.application.routes.draw do



  get 'sessions/new'

  get 'review/view'

  get 'jogo/view'

  get 'conta/view'
  get 'conta/index'
  get 'noticias/view'

  post '/upvote/:id', to: 'classificao#upvote', as: 'upvote'
  post '/downvote/:id', to: 'classificao#downvote', as: 'downvote'
  post '/follow/:id', to: 'seguidos#add', as: 'follow'
  post '/unfollow/:id', to: 'seguidos#delete', as: 'unfollow'
  get '/searchtipon/:id', to: 'search#searchtipon', as: 'searchtn'
  get '/searchtipoj/:id', to: 'search#searchtipoj', as: 'searchtj'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  get '/conta/followers/:id', to: 'frontoffice#followers', as: 'followers'
  get '/conta/follows/:id', to: 'frontoffice#follows', as: 'follows'
  get '/noticia/:id', to: 'frontoffice#view_noticia', as:  'view_noticia'
  get '/jogo/:id', to: 'frontoffice#view_jogo', as:  'view_jogo'
  get '/conta/:id', to: 'frontoffice#view_conta', as: 'view_conta'
  get '/search', to: 'search#index', as: 'search'
  get '/jogos', to: 'frontoffice#jogos_index', as: 'fjogos_index'
  get '/noticias', to: 'frontoffice#noticias_index', as: 'fnoticias_index'
  get '/contas', to: 'frontoffice#contas_index', as: 'fcontas_index'
  get '/empresas', to: 'frontoffice#empresas_index', as: 'fempresas_index'
  get '/signup', to: 'frontoffice#new_conta'
  get '/createaccount', to: 'frontoffice#new_conta'
  get '/editarconta/:id', to: 'frontoffice#edit_conta', as: 'fedit_conta'
  patch '/update/:id', to: 'frontoffice#update_conta'
  post '/createaccount', to: 'frontoffice#create_conta'
  root 'frontoffice#index'
  get '/backoffice', to: 'backoffice#index', as: 'backhome'
  get '/settings', to: 'frontoffice#settings', as: 'settings'
  resources :account_activations, only: [:edit]


  scope 'backoffice/' do
    resources :jogo
    resources :noticia
    resources :conta
    resources :review
    get '/jogo/new/', to: 'jogo#news', as: 'news'
    post '/jogo/newsteam', to: 'jogo#steam', as: 'steam'
    get '/newsletter', to: 'backoffice#newsletter', as: 'newsletter'
    post '/createaccount', to: 'review#new'
    get '/aprovar', to: 'noticia#aprovarindex', as: 'aprovarindex'
    delete '/desaprovar/:id', to: 'noticia#desaprovar', as: 'desaprovar'
    patch '/aprovar/:id', to: 'noticia#aprovar', as: 'aprovar'

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
