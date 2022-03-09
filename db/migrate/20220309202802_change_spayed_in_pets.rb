class ChangeSpayedInPets < ActiveRecord::Migration[6.1]
  def change
    change_column :pets, :spayed, :boolean, default: false
  end
end
