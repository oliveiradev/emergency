class AddUserIdToOccurrences < ActiveRecord::Migration
  def change
    add_reference :occurrences, :user, index: true, foreign_key: true
  end
end