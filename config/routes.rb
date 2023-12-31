Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
   resources :bookings
   
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
# config/routes.rb
resource :profile, only: [:show, :edit, :update, :index, :destroy]

end
