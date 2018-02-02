Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do 

	  
	  resources :groups do 
	  	resources :questions do
	  		resources :answers
	  	end
	  end
	  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
