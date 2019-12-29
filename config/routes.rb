Rails.application.routes.draw do
  resources :books do
    get 'destroyed', on: :collection
    #patch 'recover', on: :member

    #patch 'rollback', on: :member

  end

  resources :versions, only: []  do
    patch 'rollback', on: :member
  end
  #patch 'rollback', to: 'versions#rollback'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
