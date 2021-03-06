Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'api/home#hello'
  namespace :api, constraints: { format: 'json' } do
    resources :sessions, only: %i[create] do
      get :current, on: :collection
      delete :destroy, on: :collection
    end
    resources :users, only: %i[index create show]
    resources :registrations, only: %i[create]
    resources :chapters do
      scope :module => 'chapters' do
        resources :comments do
          scope :module => 'comments' do
            resources :likes, only: %i[index create] do
              delete :destroy, on: :collection
            end
          end
        end
      end
    end
  end

  match '*path', to: 'api/home#not_found', via: %i[get post put patch delete]
end
