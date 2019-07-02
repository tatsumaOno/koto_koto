class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :title
      t.text :detail
      t.integer :price
      t.float   :time
      t.boolean :work
      t.references :user
      t.timestamps
    end
  end
end
