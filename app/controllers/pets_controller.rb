class PetsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @pet = Pet.new
  end

  def create

  end
end
