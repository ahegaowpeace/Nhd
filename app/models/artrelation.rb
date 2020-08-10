class Artrelation < ApplicationRecord
	validates :book_id, uniqueness: { scope: :artist_id }

  belongs_to :book
  belongs_to :artist
end
