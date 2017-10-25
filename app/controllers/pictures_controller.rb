
class PicturesController < ApplicationController
  
  def new_form
    render("pic_templates/blank_form.html.erb")    
  end

  def create_row
    render("pic_templates/added_row.html.erb")
  end
  
  def index
    render("pic_templates/list_of_all.html.erb")
  end

  def show
    
    photo_id = params["the_id"]
    @the_caption = Photo.find(photo_id)["caption"]
  
    @the_image_url = Photo.find(photo_id)["source"]
    
    ##include ActionView::Helpers::DateHelper
    #@time_since_create = time_ago_in_words(Photo.find(photo_id)["created_at"])
    
    render("pic_templates/details.html.erb")
  end

  def edit_form
    render("pic_templates/edited_row.html.erb")
  end

  def update_row
    render("pic_templates/updated_row.html.erb")
  end
  
  def destroy_row
    render("pic_templates/deleted_row.html.erb")
  end
  
end