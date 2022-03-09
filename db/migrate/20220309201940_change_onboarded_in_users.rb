class ChangeOnboardedInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :onboarded, :boolean, default: false
  end
end
