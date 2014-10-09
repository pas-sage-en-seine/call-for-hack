Rails.application.routes.draw do
	resources :proposals, except: %i(index) do
		collection do
			get :confirm
		end
	end

	namespace :admin do
		resources :proposals, only: %i(index show destroy) do
			member do
				get :mark
				get :unmark
			end
		end
	end

	root 'site#index'
end
