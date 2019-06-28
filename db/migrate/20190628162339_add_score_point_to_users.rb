class AddScorePointToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :point, :integer
    add_column :users, :score, :integer
  end
end
