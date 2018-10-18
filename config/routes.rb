Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'

  post 'zoop' => 'application#poster'
  get 'zoop' => 'application#poster'

  post 'wish' => 'wish#makeWish'
  post 'wish/pay' => 'wish#makePayment'
end
