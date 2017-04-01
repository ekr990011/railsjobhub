Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  
  get 'freelancer/rails', to: 'freelancer#rails'
  get 'freelancer/scrape', to: 'freelancer#scrape'
  
  get 'upwork/rails', to: 'upwork#rails'
  get 'upwork/scrape', to: 'upwork#scrape'
  get 'upwork/ruby', to: 'upwork#ruby'
  
  get 'weworkremotely', to: 'weworkremotely#rails'
  
  get 'indeed', to: 'indeed#rails'
  
  get 'stackjobs', to: 'stackjobs#rails'

  resources :contacts, only: [:new, :create]
end
