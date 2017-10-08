Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :users

    namespace :rest do 
        post 'login', to: 'webservice1#login', as: :login
        post 'verify_user/:email', to: 'webservice2#verify_user', as: :verify_user, constraints: { email: /[a-zA-Z0-9_\.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+/}
    end 
end
