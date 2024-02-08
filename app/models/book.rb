class Book < ApplicationRecord
  GENRES = ['Fantasy', 'Sci-Fi', 'Mystery', 'Biography', 'History', 'Romance',
            'Horror', 'Thriller', 'Non-fiction', 'Fiction', 'Children',
            'Self-help', 'Cooking', 'Art', 'Science', 'Poetry', 'Religion',
            'Philosophy', 'Travel', 'Health', 'Fitness', 'Sports', 'Comics', 'Non-binary',
            'Not applicable']

  belongs_to :user
  has_many :orders, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true
  validates :author, presence: true
  validates :genre, presence: true, inclusion: { in: GENRES, message: "is not a valid genre" }
  validates :year, presence: true, numericality: { only_integer: true, message: "must be an integer" }
  validates :price, presence: true, numericality: { only_integer: true, message: "must be an integer" }
  validates :quantity, presence: true, numericality: { only_integer: true, message: "must be an integer" }

  include PgSearch::Model
  pg_search_scope :search_by_name_or_author,
    against: [:name, :author],
    using: {
      tsearch: { prefix: true, any_word: true }
    }
end
