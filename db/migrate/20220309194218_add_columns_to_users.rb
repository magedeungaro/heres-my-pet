class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthdate, :date
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :nickname, :string
    add_column :users, :onboarded, :boolean
    add_column :users, :share_info, :boolean
  end
end
