class Book < ApplicationRecord
	validates :title, presence: true, uniqueness: true
	validates :pagenum, presence: true

	has_many :ctgrelations
	has_many :categories, through: :ctgrelations, source: :category
	has_many :tagrelations
	has_many :tags, through: :tagrelations, source: :tag
	has_many :artrelations
	has_many :artists, through: :artrelations, source: :artist
end
