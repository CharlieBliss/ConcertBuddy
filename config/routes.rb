Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get '/events/has_groups', to: 'events#has_groups'

  resources :events, only: [:index, :show, :create] do
    get '/groups/join', to: 'groups#join'
    resources :groups, only: [:new,:create,:index,:show]
  end

  resources :messages
  resources :users, only: [:show, :edit]
  resources :artists, only: [:show, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get '/users/something', to: 'users#something'

  get '/songkick/events', to: 'songkick#events'

  get '/songkick/custom_search', to: 'songkick#custom_search', as: 'custom_search'

  get '/songkick/artist_search', to: 'songkick#artist_search', as: 'artist_search'

  get '/venues/search', to: 'venues#search', as: "venue_search"

  get '/events/paginate_events', to: 'events#paginate_events'

  post '/events/get_events', to: 'events#get_events'

  root 'events#index'


  # get '/sessions/spotify_callback', to: 'sessions#spotify_callback'

  # get '/sessions/spotify_request', to: 'sessions#spotify_request'

  # get '/sessions/spotify_create', to: 'sessions#create', as: "create_with_token"




  #new and users#create to routes




  # You can have the root of your site routed with "root"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
