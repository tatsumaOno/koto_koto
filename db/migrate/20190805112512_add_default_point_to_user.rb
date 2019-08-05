class AddDefaultPointToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :point, :integer, default: 0
  end
end
