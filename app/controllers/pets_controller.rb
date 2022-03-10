class PetsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @pet = Pet.new
    authorize @pet
  end

  def create
  end
end
