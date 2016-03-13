Rails.application.routes.draw do
  resource :maze, only: :show, controller: :maze
end
