class AddNicknameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :family_name, :string
    add_column :users, :first_name, :string
    add_column :users, :family_name_reading, :string
    add_column :users, :first_name_reading, :string
    add_column :users, :birthday, :date
  end
end
