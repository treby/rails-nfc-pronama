class UsersController < ApplicationController
  respond_to :json
  
  # Register for sent user information
  def create
    @user = User.create user_params
    
    if @user.save
      respond_with(@user) do |format|
        format.json {render}
      end
    end
  end

  def show
    @user = User.find(params[:id])
    respond_with(@user) do |format|
      format.json {render}
    end
  end

  private
  def user_params
    params.permit(:name, :blood, :birth, :sex, :opt_type)
  end
end
