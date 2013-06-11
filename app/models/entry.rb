class Entry < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :categorizations, dependent: :destroy
	has_many :categories, foreign_key: :entry_id, through: :categorizations

	attr_accessible :title, :content, :published
	validates :title, presence: true, uniqueness: true
	validates :content, presence: true
	validates :published, presence: true
end