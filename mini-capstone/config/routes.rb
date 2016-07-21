Rails.application.routes.draw do
  get '/products' => 'products#show'
  post '/products' => 'products#post'
end
