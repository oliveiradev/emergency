class AddPendingToOccurrences < ActiveRecord::Migration
  def change
    add_column :occurrences, :pending, :boolean , default: 1
  end
end
