class RemoveNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name, :integer
    remove_column :users, :user_image, :integer
  end
end
