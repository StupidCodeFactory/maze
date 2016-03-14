Rails.application.routes.draw do
  resource :maze_boards, only: [:create, :new, :show]

  root 'maze_boards#new'
end
