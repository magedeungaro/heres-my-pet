class TagReadingsController < ApplicationController

  def index
    @pet = Pet.find(params[:pet_id])
    @tag_readings = policy_scope(TagReading).order(created_at: :DESC).limit(10)
  end

  def show
    @pet = Pet.find(params[:pet_id])
    @tag_reading = TagReading.find(params[:id])
    authorize @tag_reading
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @tag_reading = TagReading.new
    authorize @tag_reading

  end

  def create
    @pet = Pet.find(params[:pet_id])
    @tag_reading = TagReading.new(tag_reading_params)
    authorize @tag_reading
    @tag_reading.pet = @pet
    @tag_reading.save
    if @tag_reading.save
      redirect_to root_path  # heroes page
    else
      render :new
    end
  end

  private
  def tag_reading_params
    params.require(:tag_reading).permit(:message, :user_consent, :lat, :lng, :pet_id)
  end
end
