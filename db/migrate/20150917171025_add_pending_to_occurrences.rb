class AddPendingToOccurrences < ActiveRecord::Migration
  def change
    add_column :occurrences, :pending, :boolean , default: 0
  end
end
