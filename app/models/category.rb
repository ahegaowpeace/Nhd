class Category < ApplicationRecord
	validates :name, presence: true, uniqueness: true

	has_many :ctgrelations
	has_many :books, through: :ctgrelations, source: :book
end
