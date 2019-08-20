class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :detail
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true
      t.timestamps
    end
  end
end
