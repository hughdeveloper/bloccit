Rails.application.routes.draw do

  resources :topics do
    resources :posts, expect: [:index]
    resources :sponsoredposts, expect: [:index]
  end

  resources :questions

  resources :advertisements

  resources :users, only: [:new, :create]


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
