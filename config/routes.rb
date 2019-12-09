Rails.application.routes.draw do
  post "likes/:post_id/destroy/self_" => "likes#destroy_self_"
  post "likes/:post_id/create/self_" => "likes#create_self_"

  post "likes/:post_id/destroy/self" => "likes#destroy_self"
  post "likes/:post_id/create/self" => "likes#create_self"


  get "likes/:post_id/destroy/show" => "likes#destroy_show"
  get "likes/:post_id/create/show" => "likes#create_show"

  post "likes/:post_id/destroy/search" => "likes#destroy_search"
  post "likes/:post_id/create/search" => "likes#create_search"

  post "likes/:post_id/destroy" => "likes#destroy"
  post "likes/:post_id/create" => "likes#create"

  get 'users/index' => "users#index"

  get 'posts/search/:category_number' => "posts#search"
  get 'posts/index' => "posts#index"
  get "users/signup" => "users#signup_form"
  post 'users/signup' => "users#signup"
  get 'users/show/:id' => "users#show"

  get "users/posts/:id/0" => "users#show_0"
  get "users/posts/:id/10" => "users#show_10"
  get "users/posts/:id/11" => "users#show_11"
  get "users/posts/:id/12" => "users#show_12"
  get "users/posts/:id/13" => "users#show_13"
  get "users/posts/:id/14" => "users#show_14"
  get "users/posts/:id/15" => "users#show_15"
  get "users/posts/:id/20" => "users#show_20"
  get "users/posts/:id/21" => "users#show_21"
  get "users/posts/:id/22" => "users#show_22"
  get "users/posts/:id/23" => "users#show_23"
  get "users/posts/:id/24" => "users#show_24"
  get "users/posts/:id/25" => "users#show_25"
  get "users/posts/:id/30" => "users#show_30"
  get "users/posts/:id/31" => "users#show_31"
  get "users/posts/:id/32" => "users#show_32"
  get "users/posts/:id/33" => "users#show_33"
  get "users/posts/:id/34" => "users#show_34"
  get "users/posts/:id/25" => "users#show_35"

  get '/' => "home#top"
  get "posts/new/:category_number" => "posts#new"
  post "posts/create/:category_number" => "posts#create"
  get 'posts/:id' => "posts#show"
  get 'login' => "users#login_form"
  post 'login' => "users#login"
  post 'logout' => "users#logout"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
