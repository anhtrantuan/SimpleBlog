class Category < ActiveRecord::Base
	has_many :categorizations, dependent: :destroy
	has_many :entries, foreign_key: :category_id, through: :categorizations

	attr_accessible :name, :description
	validates :name, presence: true, uniqueness: true
end