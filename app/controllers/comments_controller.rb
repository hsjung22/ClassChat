class CommentsController < ApplicationController

  def create
    post = Post.find(params[:id])
    post.comments.create(content: params[:content], user: current_user)
    redirect_to "/classes/#{post.group.id}"
  end

end