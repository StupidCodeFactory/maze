Rails.application.routes.draw do
  resources :maze_boards, only: [:create, :new, :show]

  root 'maze_boards#new'
end
