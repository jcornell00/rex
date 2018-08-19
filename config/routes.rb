Rails.application.routes.draw do
  # Routes for the Like resource:
  # CREATE
  get "/likes/new", :controller => "likes", :action => "new"
  post "/create_like", :controller => "likes", :action => "create"

  # READ
  get "/likes", :controller => "likes", :action => "index"
  get "/likes/:id", :controller => "likes", :action => "show"

  # UPDATE
  get "/likes/:id/edit", :controller => "likes", :action => "edit"
  post "/update_like/:id", :controller => "likes", :action => "update"

  # DELETE
  get "/delete_like/:id", :controller => "likes", :action => "destroy"
  #------------------------------

  # Routes for the Follow_request resource:
  # CREATE
  get "/follow_requests/new", :controller => "follow_requests", :action => "new"
  post "/create_follow_request", :controller => "follow_requests", :action => "create"

  # READ
  get "/follow_requests", :controller => "follow_requests", :action => "index"
  get "/follow_requests/:id", :controller => "follow_requests", :action => "show"

  # UPDATE
  get "/follow_requests/:id/edit", :controller => "follow_requests", :action => "edit"
  post "/update_follow_request/:id", :controller => "follow_requests", :action => "update"

  # DELETE
  get "/delete_follow_request/:id", :controller => "follow_requests", :action => "destroy"
  #------------------------------

  # Routes for the Place resource:
  # CREATE
  get "/places/new", :controller => "places", :action => "new"
  post "/create_place", :controller => "places", :action => "create"

  # READ
  get "/places", :controller => "places", :action => "index"
  get "/places/:id", :controller => "places", :action => "show"

  # UPDATE
  get "/places/:id/edit", :controller => "places", :action => "edit"
  post "/update_place/:id", :controller => "places", :action => "update"

  # DELETE
  get "/delete_place/:id", :controller => "places", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
