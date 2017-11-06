RailsInvitable::Engine.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :user_accepted_referrals, only: [:index, :create]
      resources :referrals, only: [:show]
      resources :withdraws, only: [:create] do
        collection do
          post :succeed
        end
      end
      resources :red_pocket_records, only: [:index]
    end
  end

end
