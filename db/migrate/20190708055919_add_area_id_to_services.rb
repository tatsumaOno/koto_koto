class AddAreaIdToServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :services,:area,foreign_key: true
  end
end
