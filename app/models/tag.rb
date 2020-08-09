class Tag < ApplicationRecord
	validates :name, presence: true, uniqueness: true

	has_many :tagrelations
	has_many :books, through: :tagrelations, source: :book
end
