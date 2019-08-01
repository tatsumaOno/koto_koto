class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name, null:false
      t.integer    :send_user,null:false
      t.integer   :receive_user,null:false
      t.timestamps
    end
  end
end
