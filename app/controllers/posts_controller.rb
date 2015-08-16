class PostsController < ApplicationController

  def create
    group = Group.find(params[:id])
    group.posts.create(content: params[:content], user: current_user)
    redirect_to "/classes/#{params[:id]}"
  end
end
