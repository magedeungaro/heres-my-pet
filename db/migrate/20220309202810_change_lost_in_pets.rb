class ChangeLostInPets < ActiveRecord::Migration[6.1]
  def change
    change_column :pets, :lost, :boolean, default: false
  end
end
