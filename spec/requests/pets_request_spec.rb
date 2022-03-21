require 'rails_helper'

RSpec.describe "Pets", type: :request do
  describe "GET /index" do
    it 'lists all pets' do
      pets1 = Pet.create!(user_id: "40b242fb-75bf-466c-8305-5129f9915512", name: "africa", gender: "male", pet_type: "dog")
      pets2 = Pet.create!(user_id: "40b242fb-75bf-466c-8305-5129f9915512", name: "calling", gender: "female", pet_type: "cat")

      get '/pets'

      expect(response.status).to eq(200)
    end
  end
end
