class AddPushUserToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :push_user, :integer
  end
end
