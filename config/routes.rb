Rails.application.routes.draw do
  # Route for bare domain:
  get('/', { :controller => 'pictures', :action => 'index' })

  # CREATE
  get("/photos/new", { :controller => "pictures", :action => "new_form" })
  get("/create_photo", { :controller => "pictures", :action => "create_row" })

  # READ
  get("/photos", { :controller => "pictures", :action => "index" })
  get("/photos/:the_id", { :controller => "pictures", :action => "show" })

  # UPDATE
  get("/photos/:the_id/edit", { :controller => "pictures", :action => "edit_form" })
  get("/update_photo/:the_id", { :controller => "pictures", :action => "update_row" })

  # DELETE
  get("/delete_photo/:the_id", { :controller => "pictures", :action => "destroy_row" })
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
