Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  get 'welcome/faq'

  # the root states the landing page or landing url. THe page we are taken to. It declares the deault page
  # What is the pound symbol in the middle of welcome#index for??????????????????????
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
