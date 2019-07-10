class AddDeletedAtToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :deleted_at, :datetime
    add_index :services, :deleted_at
  end
end
