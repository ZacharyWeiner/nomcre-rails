class UsersController < ApplicationController
  def show
    set_user
  end

  protected
  def set_user
    if params[:id]
      @user = User.find(params[:id])
    end
  end
end
