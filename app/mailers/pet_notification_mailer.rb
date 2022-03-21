class PetNotificationMailer < ApplicationMailer
  layout "mailer"
  default from: 'heresmypet@gmail.com'

  def pet_location_email(image)
    @tag_reading = params[:tag_reading]
    @pet = @tag_reading.pet
    @user = @pet.user

    attachments[image] = {
      data: File.read("#{Rails.root}/app/assets/images/#{image}"),
      mime_type: "image/png"

    }

    mail(to: @user.email, subject:"Somebody may have found #{@pet.name}")
  end
end
