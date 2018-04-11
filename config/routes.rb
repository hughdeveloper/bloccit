Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsoredposts, except: [:index]
  end

  resources :questions

  resources :advertisements

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  #we use only: [] because we don't want to create any /posts/:id routes, just posts/:post_id/comments routes.
  resources :posts, only: [] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end


  post 'users/confirm' => "users#confirm"



  #we call the resources method and pass it a Symbol. This instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post


  #instead of going to welcome/about the link will show about
  get 'about' => 'welcome#about'


  get 'welcome/contact'

  get 'welcome/faq'

  # the root states the landing page or landing url. THe page we are taken to. It declares the deault page
  # What is the pound symbol in the middle of welcome#index for??????????????????????
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
