class AddDefaultScoreToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :score, :integer, default: 0
  end
end
