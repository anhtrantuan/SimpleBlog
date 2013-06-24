class AddIndexesToCategorization < ActiveRecord::Migration
  def up
  	add_index :categorizations, :category_id
  	add_index :categorizations, :entry_id
  end

  def down
  	remove_index :categorizations, :category_id
  	remove_index :categorizations, :entry_id
  end
end
