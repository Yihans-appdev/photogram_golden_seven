
class PicturesController < ApplicationController
  
  def new_form
    render("pic_templates/blank_form.html.erb")    
  end

  def create_row
    new_pic = params["the_source"]
    new_caption = params["the_caption"]
    
    i = Photo.new
    i.source=new_pic
    i.caption=new_caption
    i.save
    
    
    redirect_to("/photos")
  end
  
  def index
    @all_photos = Photo.all
    render("pic_templates/list_of_all.html.erb")
  end

  def show
    
    @photo_id = params["the_id"]
    @the_caption = Photo.find(@photo_id)["caption"]
    @the_image_url = Photo.find(@photo_id)["source"]
    
    ##include ActionView::Helpers::DateHelper
    #@time_since_create = time_ago_in_words(Photo.find(photo_id)["created_at"])
    
    render("pic_templates/details.html.erb")
  end

  def edit_form
    @photo_id = params["the_id"]
    @original_url = Photo.find(@photo_id)["source"].to_s
    @original_caption = Photo.find(@photo_id)["caption"]
    
    render("pic_templates/edit_row.html.erb")
  end

  def update_row
    
    @photo_id = params["the_id"]
    i = Photo.find(@photo_id)
    i.source= params["the_source"]
    i.caption= params["the_caption"]
    i.save
    
    redirect_to("/photos/" + @photo_id)
  end
  
  def destroy_row
    photo_id = params["the_id"]
    Photo.find(photo_id).destroy
    redirect_to("/photos")
  end
  
end