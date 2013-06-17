class Categorization < ActiveRecord::Base
	belongs_to :category
	belongs_to :entry

	attr_accessible :category_id, :entry_id
end