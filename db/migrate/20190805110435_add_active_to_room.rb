class AddActiveToRoom < ActiveRecord::Migration[5.2]
  def change
    rename_column :rooms, :push_user, :rated_user
    add_reference :rooms,:service
    add_column :rooms, :activated, :boolean, default: true
  end
end
