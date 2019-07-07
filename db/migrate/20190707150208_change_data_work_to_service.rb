class ChangeDataWorkToService < ActiveRecord::Migration[5.2]
  def change
    change_column :services, :work, :int
  end
end
