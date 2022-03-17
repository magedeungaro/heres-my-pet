class PetNotificationMailer < ApplicationMailer
  layout "mailer"
  default from: 'heresmypet@gmail.com'

  def pet_location_email
    @tag_reading = params[:tag_reading]
    @pet = @tag_reading.pet
    @user = @pet.user


    mail(to: @user.email, subject:"Somebody may have found #{@pet.name}") do |format|
      format.html { render layout: 'mailer' }
    end
  end
end
