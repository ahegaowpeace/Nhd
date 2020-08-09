class Book < ApplicationRecord
	validates :title, presence: true
	validates :pagenum, presence: true

	has_many :ctgrelations
	has_many :categories, through: :ctgrelations, source: :category
end
