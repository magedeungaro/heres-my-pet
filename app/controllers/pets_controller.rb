class PetsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @user = User.find(params[:user_id])
    @pet.user = @user
    authorize @pet
    @pet.save
  end

  private

  def pet_params
    params.require(:pet).permit(:user_id, :name, :photo, :sex, :birthdate, :spayed, :additional_info, :special_treatment, :lost, :pet_type)
  end
end
