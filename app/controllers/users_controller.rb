class UsersController < ApplicationController

  def show
    @user = current_user
    @pets = current_user.pets
    authorize @pets
  end
end
