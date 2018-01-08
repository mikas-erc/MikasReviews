Rails.application.routes.draw do
  get 'review/view'

  get 'jogo/view'

  get 'conta/view'

  get 'noticias/view'

  root 'frontoffice#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
