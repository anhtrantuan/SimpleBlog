class Comment < ActiveRecord::Base
	belongs_to :entry

	attr_accessible :author, :content, :entry_id, :created_at
	validates :author, presence: true
	validates :content, presence: true
	validates :entry_id, presence: true
end