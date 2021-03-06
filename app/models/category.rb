class Category < ActiveRecord::Base
	has_many :categorizations, dependent: :destroy
	has_many :entries, through: :categorizations

	attr_accessible :name, :description
	validates :name, presence: true, uniqueness: true
end