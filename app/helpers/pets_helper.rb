module PetsHelper
  def redirect_pet_owner(pet)
    return unless current_user

    redirect_to pet_path(pet) if current_user = pet.user
  end
end
