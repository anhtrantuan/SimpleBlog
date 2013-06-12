class InitializeDatabase < ActiveRecord::Migration
  def up
  	create_table :categories do |t|
  		t.string :name
  		t.text :description
  	end

  	create_table :entries do |t|
  		t.string :title
  		t.text :content
  		t.datetime :published, default: DateTime.current
  	end

  	create_table :categorizations do |t|
  		t.integer :category_id
  		t.integer :entry_id
  	end

    create_table :comments do |t|
      t.string :author
      t.text :content
      t.integer :entry_id
      t.datetime :created_at, default: DateTime.current
    end
  end

  def down
  	drop_table :categorizations
  	drop_table :entries
  	drop_table :categories
    drop_table :comments
  end
end
