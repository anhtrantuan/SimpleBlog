class Entry < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	has_many :categorizations, dependent: :destroy
	has_many :categories, through: :categorizations

	attr_accessible :title, :content, :category_ids
	validates :title, presence: true, uniqueness: true
	validates :content, presence: true

	before_update :touch
end