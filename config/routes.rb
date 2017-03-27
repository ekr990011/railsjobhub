Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main#index'
  
  get 'freelancer', to: 'freelancer#rails'
  
  get 'upwork', to: 'upwork#rails'
  
  get 'weworkremotely', to: 'weworkremotely#rails'

end
