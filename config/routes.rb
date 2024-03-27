Rails.application.routes.draw do

  resources :billings
  mount Notifications::Engine => "/notifications"
  resources :transactions

  resources :transactions do
    member do
      get 'details'
    end
  end
 
  class String
    def self.random(len=32, character_set = ["A".."Z", "a".."z", "0".."9"])
      chars = character_set.map{|x| x.is_a?(Range) ? x.to_a : x }.flatten
      Array.new(len){ chars.sample }.join
    end
  end
  get 'payment_history' => 'static_pages#payment_history'
  get 'subscribers' => 'static_pages#subscribers'  
  get 'feeds' => 'notifications#index'
  
  post 'web' => "retracts#web"
  
  get 'callback' => "transactions#callback"
  get 'upgrade' => "transactions#upgrade"  

  get '/' => 'static_pages#home'
  devise_for :users, :path => 'system-authentication'
  get '/system-authentication/sign_out' => 'sessions#destroy'
  root 'static_pages#home'
  get 'dashboard' => 'static_pages#home'
  get 'lawfirm-users-repository' => 'static_pages#lawfirmusers'
  get 'lawfirm-legalcases-repository' => 'static_pages#lawfirmcases'

  get 'lawfirm-legalcases-assign-cost' => 'static_pages#clawfirmcases'

  get 'lawfirm-legalcases-assign-attorney' => 'static_pages#assignattorney'
  
  get 'attorney-legalcases-repo' => 'static_pages#attorneycases'

  get 'attorney-legalcases-discussion' => 'static_pages#attorneycasesdis'
  get 'attorney-legalcases-tasks' => 'static_pages#attorneycasestask'

  get 'client-legalcases-repo' => 'static_pages#clientcases'
  get 'client-legalcases-discussion' => 'static_pages#clientcasesdis'

  get 'subcribers' =>'static_pages#subcribers'
  get 'lawfirm-attorneys-repository' => 'static_pages#attorneys'
  get 'cases-completed-attorneys' => 'static_pages#cattorneys'

  get 'lawfirm-clients-repository' => 'static_pages#clients'
  get '7QXY84CQ3ZX9H21HQOVN24M5NF89L2WQQ4L3IUHW253C5JH60WA84622U9SRBYW8TMVE2B9Uacetrace-lawfirms-admins' => 'static_pages#admins'
  get 'legalcase-new-entry' => 'mycases#new'
  #get 'PW036GOYAVKRUI2S--24M5NF89L2WQQ4L3IU-HW253C5JH60WAnew-user-registration' => 'users#new'
  
  get 'M0R7F8O906ILVU5WY91WV4MUJJKSTM774ONCMBTNVTMNJJHSQKH80OCASGF3F0S-acetrace-lawfirms-new-entry' => 'lawfirms#new'

  resources :users, :path => 'QI0V438P4SIPW036GOYAVKRUI2SOJT9QFPV8AGQ7YUNP3F8D8PWTH155QWQBBAMOCVGASQSMNKF-acetrace-membership-rep'
  #get 'users/user_id', to: 'users#show', as: 'acetracemembership'

  resources :mycases, :path => 'QI0V438P4SIPW0-Legal-Case' do
    member do
      get 'meet'
      get 'billing'
	    get 'casetask'
      get 'inview'
      get 'completed'
      patch 'assign_attorney'
      get 'new_assign'
    end
  end
  post 'create_admin' => 'admins#create' 
  get 'PP9OCF35EPSYUSHXYDMPAJ27HA2BE70EO032OAAW5GFUDZ6PNRLZXGOWJE3L18YAWGVBXX2TPXY-create-admins-new'=> 'admins#new'

  post 'create_users_admin' => 'users#create' 
  patch 'update_users_admin' => 'users#update'
  put 'update_users_admin' => 'users#update'

  resources :users, as: 'users_admin', :path => 'Acetrace-users'
 
  resources :users_admin, :path => "acetracemembership"
  post 'create_sadmin' => 'sadmins#create' 
  resources :sadmins
	resources :admins
  resources :attorneys
  resources :retracts
  resources :clients
  resources :lawfirms do
    member do
      get 'activate_lawfirm'
      get 'deactivate_lawfirm'
    end
  end
  
  resources :adminassistants
  resources :lawfirms, :path => 'L3D7ZLU9SEMWM0R7F8O906ILVU5WY91WV4MUJJKSTM774ONCMBTNVTMNJJHSQKH80OCASGF3F0S-acetrace-lawfirms-repo'
 
  resources :mycasecomments, :path => 'Legal-case-discussion' do 
    member do
		  get 'download_file'
		  #match 'mycasecomments/download_file/:id', => 'mycasecomments#download_file' :as => :attachment 
    end
  end	
  
  resources :tasks, :path => 'Legal-case-task' do 
  	member do
  		get 'download_file'
  		#match 'mycasecomments/download_file/:id', => 'mycasecomments#download_file' :as => :attachment 
    end
  end	

  resources :billings, :path => 'Legal-case-billing' do 
    member do
      get 'download_file'
      get 'approve_billing'
      #match 'mycasecomments/download_file/:id', => 'mycasecomments#download_file' :as => :attachment 
    end
  end 
  resources :mycases, :path => 'legal-case' do
    resources :mycasecomments
	 resources :tasks
  end	
  resources :tasks
  resources :mycases, :path => 'legal-case' do
    resources :tasks
  end 

  resources :mycases, :path => 'legal-case' do
    resources :billings
  end   
  resources :posts, :path => 'PFPM02FLORDO2WZF4QU47NORRUUP6WSU80K7K7VMRZKYP5JIDZAWLXP5KBNIMPV4E0QYWJSQUB5-acetracecms-forum-repo'
  resources :posts, :path => 'Acetrace-Forum-Post' do
    resources :comments
  end  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
