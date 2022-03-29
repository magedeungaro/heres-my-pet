class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :hero]
  before_action :set_pet, only: [:show, :edit, :destroy, :update, :hero]

  include PetsHelper

  def index
    @pets = policy_scope(Pet).where(user_id: current_user).order(name: :asc).includes([:photo_attachment])
  end

  def show
    Sentry.capture_exception(StandardError.new('pet without qr code')) unless @pet.qr_code.attached?

    authorize @pet
    @reading = true if params[:qrcode]
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
      @pet.attach_qr(request.path)
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
    authorize @pet
  end

  def update
    authorize @pet
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  def destroy
    authorize @pet
    @pet.destroy
    redirect_to pets_path
  end

  def hero
    authorize @pet
    redirect_to root_path unless params[:message] == 'sent'
    redirect_pet_owner @pet
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :photo, :gender, :birthdate, :spayed, :additional_info, :lost, :pet_type)
  end
end
