Rails.application.routes.draw do
	resources :proposals, except: %i(index) do
		collection do
			get :confirm
		end
	end

	namespace :admin do
		resources :proposals, only: %i(index show destroy)
	end

	root 'site#index'
end
