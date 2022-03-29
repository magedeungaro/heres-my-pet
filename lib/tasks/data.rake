namespace :data do
  desc "patch all pets without qr code"
  task patch: :environment do
    Pet.without_qr.each do |pet|
      request_path = "/pets/#{pet.id}"
      pet.attach_qr(request_path)
    end
  end
end
