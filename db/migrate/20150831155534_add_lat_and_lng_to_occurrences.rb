class AddLatAndLngToOccurrences < ActiveRecord::Migration
  def change
    add_column :occurrences, :lat, :float
    add_column :occurrences, :lng, :float
  end
end
