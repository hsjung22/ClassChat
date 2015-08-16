class GroupsController < ApplicationController
  
  def index
    @groups = Group.all
  end

  def create
    group = Group.create(name:params[:name], description:params[:description], user: current_user)
    if group.errors.any?
      flash[:errors]= group.errors.full_messages
      redirect_to "/classes"
    else
      Member.create(user:current_user, group:group)
      redirect_to "/classes"
    end
  end

  def show
    @group = Group.find(params[:id])
    @members = @group.users
    @groups_joined = current_user.groups_joined

    @posts = @group.posts
    
  end

  def delete
    group = Group.find(params[:id])
    group.destroy
    redirect_to "/classes"
  end


end
