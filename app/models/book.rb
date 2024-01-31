class Book < ApplicationRecord
  GENRES = ['Fantasy', 'Sci-Fi', 'Mystery', 'Biography', 'History', 'Romance',
            'Horror', 'Thriller', 'Non-fiction', 'Fiction', 'Children',
            'Self-help', 'Cooking']

  belongs_to :user
  has_many :orders

  has_many_attached :photos

  validates :name, presence: true
  validates :author, presence: true
  validates :genre, presence: true, inclusion: { in: GENRES }
  validates :year, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
