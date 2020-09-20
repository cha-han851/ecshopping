class UsersController < ApplicationController
  
  before_action :check_user, only:[:show, :edit, :update]
  
  def create
    @user = User.new(configure_permitted_parameters_params)
    if @user.save
      redirect_to root_path
    else
      render template: 'devise/registrations/new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  private
  def check_user
    if !user_signed_in? 
    redirect_to root_path
    end
  end
end
