class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.string :description
      t.string :pic

      t.timestamps null: false
    end
  end
end
