class Artist < ApplicationRecord
	validates :name, presence: true, uniqueness: true

	has_many :artrelations
	has_many :books, through: :artrelations, source: :book
end
