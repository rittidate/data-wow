class Book < ApplicationRecord
  has_many :book_tags
  has_many :tags, through: :book_tags
  
  validates :author, presence: true
  validates :title, presence: true

end
