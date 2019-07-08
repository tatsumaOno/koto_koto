class AddCategoryToServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :services,:category,foreign_key: true
  end
end
