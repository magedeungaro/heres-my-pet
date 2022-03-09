class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets, id: :uuid do |t|
      t.string :name
      t.string :gender
      t.date :birthdate
      t.string :pet_type
      t.string :additional_info
      t.boolean :spayed
      t.boolean :lost
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
