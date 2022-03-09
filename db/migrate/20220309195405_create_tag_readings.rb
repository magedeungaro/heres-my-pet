class CreateTagReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_readings, id: :uuid do |t|
      t.float :lat
      t.float :lng
      t.text :message
      t.boolean :user_consent
      t.references :pet, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
