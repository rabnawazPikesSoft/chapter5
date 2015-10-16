class UsersController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, only: [:edit, :update]
   #before_action :correct_user,   only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)
    if @user.save
         session[:user_id] = @user.id
      #login_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  def show
      @user =User.find(params[:id])
  end
def edit 
@user = User.find_by(params[:id])
end
def update

  @user = User.find_by(params[:id])

  if @user.update_attributes(user_params)
    flash[:success]="infromation udapted"
    redirect_to @user
  else
    render 'edit'
  end
end 


  def logged_in_user
      unless @user.nil?
        flash[:danger] = "Please log in."
        redirect_to sessions_new_path
      end
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
  private
def user_params
      params.require(:user).permit(:name, :email, :password, :age,
                                   :password_confirmation)
    end
end
