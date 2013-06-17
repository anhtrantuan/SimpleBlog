class Entry < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :categorizations, dependent: :destroy
	has_many :categories, through: :categorizations

	attr_accessible :title, :content, :published, :category_ids
	validates :title, presence: true, uniqueness: true
	validates :content, presence: true
end