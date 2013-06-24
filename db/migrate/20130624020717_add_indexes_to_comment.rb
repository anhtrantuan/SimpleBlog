class AddIndexesToComment < ActiveRecord::Migration
  def up
  	add_index :comments, :entry_id
  end

  def down
  	remove_index :comments, :entry_id
  end
end
