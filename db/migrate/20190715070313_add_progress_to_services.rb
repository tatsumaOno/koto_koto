class AddProgressToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :progress, :int, default: 0
  end
end
