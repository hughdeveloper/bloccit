Rails.application.routes.draw do

  #get 'advertisements/index'
  #get 'advertisements/show'
  #get 'advertisements/new'
  #get 'advertisements/create'
  resources :advertisements

  # resources :posts gets all the posts files that are listed below
  #get 'posts/index'
  #get 'posts/show'
  #get 'posts/new'
  #get 'posts/edit'
  #we call the resources method and pass it a Symbol. This instructs Rails to create post routes for creating, updating, viewing, and deleting instances of Post
  resources :posts


  #instead of going to welcome/about the link will show about
  get 'about' => 'welcome#about'


  get 'welcome/contact'

  get 'welcome/faq'

  # the root states the landing page or landing url. THe page we are taken to. It declares the deault page
  # What is the pound symbol in the middle of welcome#index for??????????????????????
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
