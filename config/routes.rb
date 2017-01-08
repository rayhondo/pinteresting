Rails.application.routes.draw do
  resources :pins, :path => "/doob" do
  	put "like", to: "pins#upvote"
  	put "dislike", to: "pins#downvote"
  end	
  devise_for :users
  	root "pins#index"
	get "about" => "pages#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
