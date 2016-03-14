Rails.application.routes.draw do
  resources :maze_boards, only: [:create, :new, :show] do
    resource :solve, only: :create
  end

  root 'maze_boards#new'
end
