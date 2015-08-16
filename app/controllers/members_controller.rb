class MembersController < ApplicationController
  def create
    Member.create(user: current_user, group:Group.find(params[:group]))
    redirect_to "/classes/#{params[:group]}"
  end

  def destroy
    member = Member.find_by(user: current_user, group:Group.find(params[:id]))
    member.destroy
    redirect_to "/classes/#{params[:id]}"
  end
end