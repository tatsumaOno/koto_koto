class AddIntroductionNicknameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :text
    add_column :users, :nickname, :string
  end
end
