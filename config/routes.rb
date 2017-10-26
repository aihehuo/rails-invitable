RailsInvitable::Engine.routes.draw do
  
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :user_accepted_referrals, only: [:index, :create]
    end
  end

end
