class ChangeShareInfoInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :share_info, :boolean, default: false
  end
end
