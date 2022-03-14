class TagReadingsController < ApplicationController

  def index
    @tag_readings = TagReading.all
  end

  def show
    @tag_reading = TagReading.find(params[:id])
  end

  def new
    @tag_reading = TagReading.new

  end

  def create
    @pet = Pet.find(params[:pet_id])
    @tag_reading = TagReading.new(tag_reading_params)
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
