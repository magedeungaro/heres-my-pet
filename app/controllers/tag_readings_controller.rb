class TagReadingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  include PetsHelper

  def index
    @pet = Pet.find(params[:pet_id])
    @tag_readings = policy_scope(TagReading).where(pet_id: @pet).order(created_at: :DESC).limit(10)
  end

  def show
    if params[:notification_id]
      @notification = Notification.find(params[:notification_id])
      @notification.viewed = true
      @notification.save
    end

    @tag_reading = TagReading.find(params[:id])
    @pet = @tag_reading.pet
    authorize @tag_reading
    @markers = [{lat: @tag_reading.lat, lng: @tag_reading.lng}]
  end

  def new
    @pet = Pet.find(params[:pet_id])
    redirect_pet_owner @pet

    @tag_reading = TagReading.new
    authorize @tag_reading

  end

  def create
    @pet = Pet.find(params[:pet_id])
    @tag_reading = TagReading.new(tag_reading_params)
    authorize @tag_reading
    @tag_reading.pet = @pet
    if @tag_reading.save

      @notification = Notification.new(notifiable: @tag_reading)
      @notification.content = "Somebody may have found #{@pet.name}!"
      @notification.user = @pet.user
      @notification.save



      UserChannel.broadcast_to(@pet.user, {
          html: render_to_string(partial: "notifications/notification", locals: {notification: @notification}),
          push_data: @notification.to_json,
          path: "https://www.heresmy.pet/#{@notification.notifiable_type.underscore}s/#{@notification.notifiable_id}"
        })

      PushChannel.broadcast_to(@pet.user, {push_data: @notification.to_json,
      path: "https://www.heresmy.pet/#{@notification.notifiable_type.underscore}s/#{@notification.notifiable_id}"})

      NotificationChannel.broadcast_to(@pet.user, render_to_string(partial: "shared/notifications_navbar", locals: {counter: @pet.user.notifications.unread.length}))

      PetNotificationMailer.with(tag_reading: @tag_reading).pet_location_email("twitter.png").deliver_now

      redirect_to hero_path(id: @pet, message: 'sent')

      return
    else
      render :new
    end
  end

  private
  def tag_reading_params
    params.require(:tag_reading).permit(:message, :user_consent, :lat, :lng, :pet_id)
  end
end
