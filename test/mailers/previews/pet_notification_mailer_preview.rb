# Preview all emails at http://localhost:3000/rails/mailers/pet_notification_mailer
class PetNotificationMailerPreview < ActionMailer::Preview

    def welcome_email
      UserMailer.with(user: User.first).welcome_email
    end

end
