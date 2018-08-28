class UsersController < ApplicationController
  before_action :find_users, except: %i(index new create)

  def index; end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:success] = 'User sucessfully created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path
      flash[:success] = "User successfully updated"
    end
  end

  def destroy
    if @user.destroy
      redirect_to recipes_path
      flash[:success] = 'User successfully deleted'
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation)
  end

  def find_users
    @user = User.find(params[:id])
  end
end
