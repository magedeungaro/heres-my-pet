class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :delete]

  def show
    authorize @pet
  end

  def new
    @user = current_user
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @user = current_user
    @pet.user = @user
    authorize @pet
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :photo, :gender, :birthdate, :spayed, :additional_info, :lost, :pet_type)
  end
end
