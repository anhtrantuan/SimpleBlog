class CreateCategorizationsTable < ActiveRecord::Migration
  def change
  	create_table :categorizations do |t|
  		t.integer :category_id
  		t.integer :entry_id
  	end

  	add_index :categorizations, :category_id
  	add_index :categorizations, :entry_id
  end
end
