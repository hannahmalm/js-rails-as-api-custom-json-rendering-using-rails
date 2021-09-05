Rails.application.routes.draw do
  get '/birds' => 'birds#index'
  get '/birds/:id' => 'birds#show' # new
  #We can use multiple routes to differentiate between specific requests. 
  #In an API, these are typically referred to as endpoints.
end