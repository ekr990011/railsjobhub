Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home_page#index'
  get 'home/index', to: 'home_page#index', as: '/'
  get 'home/:id', to: 'home_page#show', as: 'home_show'

  resources :contacts, only: [:new, :create]
  resources :jobs, only: [:new, :create, :show]
  resources :search, only: [:index]

  # get 'freelancer/rails', to: 'freelancer#rails'
  # get 'freelancer/scrape', to: 'freelancer#scrape'
  #
  # get 'upwork/rails', to: 'upwork#rails'
  # get 'upwork/scrape', to: 'upwork#scrape'
  # get 'upwork/ruby', to: 'upwork#ruby'
  #
  # get 'weworkremotely', to: 'weworkremotely#rails'
  # get 'indeed', to: 'indeed#rails'
  # get 'stackjobs', to: 'stackjobs#rails'
  # get 'github/:id', to: 'github#show', as: 'github'
  # get 'github/show', to: 'github#show'
  # resources :githubs, only: [:show]
  # get 'cybercoders', to: 'cybercoders#rails'
  # get 'careerbuilder', to: 'careerbuilder#rails'
  # get 'remotelyawesome', to: 'remotelyawesome#rails'
  #
  # get 'main/payment', to: 'main#payment'


  # resources :contracts do #add preview later
  #   get 'preview'
  # end

  # resource :charges, only: [:new, :create, :invoice] do
  #   get 'invoice'
  # end

  # resource :job_charges, only: [:new, :create, :invoice] do
  #   get 'invoice'
  # end
end
