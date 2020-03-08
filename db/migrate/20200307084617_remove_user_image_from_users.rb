class RemoveUserImageFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_id, :integer
    remove_column :users, :image_id, :integer
  end
end
