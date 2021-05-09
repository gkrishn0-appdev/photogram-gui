class UsersController < ApplicationController
  def index
    matching_users= User.all
    @list_of_users = matching_users.order({:username => :asc })
    render({:template => "user_templates/index.html.erb"})
  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({:username => url_username})
    @the_user = matching_usernames.at(0)

    render({:template => "user_templates/show.html.erb"})
  end

  def create
    input_image = params.fetch("query_image")


    a_new_user = User.new
    a_new_user.username = input_image

    a_new_user.save
    redirect_to("/users/" + a_new_user.username)

    #render({:template => "photo_templates/create.html.erb"})
  end

  def update
    the_id = params.fetch("modify_id")
    matching_users=User.where({:id => the_id})
    the_user = matching_users.at(0)
    input_image = params.fetch("query_image")
    #input_caption = params.fetch("query_caption")
    #input_owner_id = params.fetch("query_owner_id")

    the_user.username=input_image
    #the_photo.caption = input_caption
    the_user.save
    redirect_to("/users/" + the_user.username)
    #render({:template => "photo_templates/update.html.erb"})
  end
  
end