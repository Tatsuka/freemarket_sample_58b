class Users::PasswordsController < ApplicationController
  def new
    @user = current_user
  end
  def edit
    @user = current_user
  end
  def update
    @user = current_user
  end
  def create
    @user = current_user
  end
end
