class EditAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :pufecture_id, :integer
    add_column    :addresses, :prefecture_id, :integer
  end
end
