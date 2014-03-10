Mmagap::Application.routes.draw do
  
  
  root :to => 'videos#index'
  
  
  #devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self) 
  devise_for :admin_users, ActiveAdmin::Devise.config


  resources :student_teacher_profiles
  resources :comments
  resources :comment_likes
  resources :likes


  #resources :videos  
  
  
  #following system
  resources :relationships, only: [:create, :destroy]
 
  post "zencoder-callback" => "zencoder_callback#create", :as => "zencoder_callback"
  get 'tags/:tag', to: 'videos#tag_page', as: :tag
  
 
  
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  devise_for :users, :controllers => {:registrations => "registrations"}
    
  #devise_for :users
  match 'users/:id' => 'users#show'

  devise_scope :user do
    get 'register' , :to => 'devise/registrations#new', as: :register
    get 'mydashboard', :to => 'users#dashboard', as: :mydashboard
    get 'user/following/:id', to: 'users#following', as: :following
    get 'user/followers/:id', to: 'users#followers', as: :followers
  end
  

  match '/home' => 'videos#index', :as => 'home'

  
  resources :videos do
    collection do
      #get 'lesson' => 'videos#lesson', :as => 'lesson'
      #post 'lesson_create' => 'videos#lesson_create', :as => 'lesson_create'
      get '/lesson' => 'videos#lesson', :as => 'lesson'
      post '/lesson' => 'videos#lesson_create', :as => 'lesson_create'
    end
  end
  
  get '/lesson' => 'videos#lesson', :as => 'lesson'
  post '/lesson' => 'videos#lesson_create', :as => 'lesson_create'
  
  get '/show_lesson_video/:id' => 'videos#show_lesson_video', :as => 'show_lesson_video'
  get '/purches_lesson_video/:id' => 'videos#purches_lesson_video', :as => 'purches_lesson_video'
  
  #get '/lesson_checkouts' => 'lesson_checkouts#index'
  
  resources :lesson_checkouts
  #get '/lesson_checkout/new/:video_id' => 'lesson_checkouts#new', :as => 'lesson_pay_new'
  #post '/lesson_checkout/new/:video_id' => 'lesson_checkouts#create', :as => 'lesson_pay_create'
  
  get '/lesson_checkout/new/' => 'lesson_checkouts#new', :as => 'lesson_pay_new'
  post '/lesson_checkout/new/' => 'lesson_checkouts#create', :as => 'lesson_pay_create'
  
  get '/paypal_pro/:id' => 'lesson_checkouts#paypal_pro', :as => 'paypal_pro'
  post '/paypal_pro/:id' => 'lesson_checkouts#paypal_do_direct', :as => 'paypal_do_direct'
  
  
  get '/paypal_success/:id' => 'lesson_checkouts#paypal_success', :as => 'paypal_success'
  get '/paypal_failure/:id' => 'lesson_checkouts#paypal_failure', :as => 'paypal_failure'
  get '/paypal_ipn/:id' => 'lesson_checkouts#paypal_ipn', :as => 'paypal_ipn'
  
  #get '/paypal_do_direct/:id' => 'lesson_checkouts#paypal_do_direct', :as => 'paypal_do_direct'
  #get '/paypal_do_direct/:id' => 'lesson_checkouts#paypal_do_direct_new', :as => 'paypal_do_direct_new'
 
  
  
  
  match '/tags' => 'videos#tag_page', :as => 'tags'
  resources :videos do
    member do
      get 'inappropriate'
    end 
          resources :comments
          member { post :vote }
    end


  resources :users
  resources :plans
  resources :subscriptions
  
  resources :inquiries, :only => [:new, :create] do
    get 'thank_you', :on => :collection
  end

  #get "paypal/new/:plan_id", to: "subscriptions#new", as: :new
  #get "paypal/checkout", to: "subscriptions#paypal_checkout", as: :paypal_checkout
  
  match '/paypal/checkout'=>'subscriptions#paypal_checkout'
  get '/paypal/checkout'=>'subscriptions#paypal_checkout'
  
  #get "paypal/checkout", to: "subscriptions#paypal_checkout"
 
 

  resources :requests
  resources :homes

  match "/404", :to => "videos#index"

  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
  match '/new_within_follow' => 'conversations#new_within_follow', via: :get
  match '/start' => 'conversations#start', :via => :get
  match '/find_user' => 'users#find_user', :via => :get

  resources :messages
    match '/profile' => 'users#profile', :via => :get
    match '/userspage' => 'static#userspage', :via => :get
    match '/help' => 'static#help', :via => :get
    match '/termsofuse' => 'static#termsofuse', :via => :get
    match '/aboutus' => 'static#aboutus', :via => :get
    match '/contactus' => 'static#contactus', :via => :get
  
  match 'cms_pages/show/:id' => 'cms_pages#show'
  
  
    
end
