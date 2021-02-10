class Comment < ApplicationRecord
	validates :user, presence: true
	validates :comment, presence: true

	has_many :cmtrelations
	has_many :books, through: :cmtrelations, source: :book
end
