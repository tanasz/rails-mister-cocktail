Rails.application.routes.draw do

  get root  to: 'cocktails#index'
  delete   'doses/:id',  to: 'doses#destroy'
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:create, :new]
  end


end
