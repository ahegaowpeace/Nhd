class Tagrelation < ApplicationRecord
	validates :book_id, uniqueness: { scope: :tag_id }

  belongs_to :book
  belongs_to :tag
end
