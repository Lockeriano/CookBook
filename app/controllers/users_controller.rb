# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_users, except: %i(index new create)
  before_action :logged_in_user, only: %i(edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def index; end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
      flash[:success] = 'User successfully created'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user
      flash[:success] = 'User successfully updated'
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation)
  end

  def find_users
    @user = User.find(params[:id])
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  def correct_user
    find_users
    redirect_to(root_url) unless @user == current_user
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
