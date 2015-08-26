class AddCheckedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :checked , :boolean , default: 0
  end
end
