require 'rails_helper'

RSpec.describe "Pets", type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:all) do
    @owner = create(:user)
    @cat = create(:pet, user: @owner)
  end

  describe "Accessing a pet profile page" do

    it "loads the show page with the pet name" do
      visit pet_path(@cat)

      expect(page).to have_content(@cat.name)
    end

  end

end
