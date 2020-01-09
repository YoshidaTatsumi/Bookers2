class Book < ApplicationRecord
	belongs_to :user

	validates :title, presence: true, length: {maximum: 199}
	validates :body, presence: true, length: {maximum: 199}
end
