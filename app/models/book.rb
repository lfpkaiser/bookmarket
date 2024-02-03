class Book < ApplicationRecord
  GENRES = ['Fantasy', 'Sci-Fi', 'Mystery', 'Biography', 'History', 'Romance',
            'Horror', 'Thriller', 'Non-fiction', 'Fiction', 'Children',
            'Self-help', 'Cooking']

  belongs_to :user
  has_many :orders, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true
  validates :author, presence: true
  validates :genre, presence: true, inclusion: { in: GENRES, message: "is not a valid genre" }
  validates :year, presence: true, numericality: { only_integer: true, message: "must be an integer" }
  validates :price, presence: true, numericality: { only_integer: true, message: "must be an integer" }
  validates :quantity, presence: true, numericality: { only_integer: true, message: "must be an integer" }
end
