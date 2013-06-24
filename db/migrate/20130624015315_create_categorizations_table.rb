class CreateCategorizationsTable < ActiveRecord::Migration
  def change
  	create_table :categorizations do |t|
  		t.integer :category_id
  		t.integer :entry_id
  	end
  end
end
