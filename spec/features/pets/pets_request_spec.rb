require 'rails_helper'

RSpec.describe "Pets", type: :request do
  describe "GET /index" do
    it 'lists all pets' do
      user1 = User.create!(first_name: "Carla", last_name:"Valdivia", birthdate: "10/05/1990", email:"carla@gmail.com", password:"123456")
      pets1 = Pet.create!(user_id: user1.id, name: "africa", gender: "male", pet_type: "dog")
      pets2 = Pet.create!(user_id: user1.id, name: "calling", gender: "female", pet_type: "cat")

      get "/pets"

      expect(response.status).to eq(200)
    end
  end
end
