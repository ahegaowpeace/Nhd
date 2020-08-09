class Ctgrelation < ApplicationRecord
	validates :book_id, uniqueness: { scope: :category_id }

  belongs_to :book
  belongs_to :category
end
