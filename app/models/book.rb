class Book < ApplicationRecord
  belongs_to :user
  has_many :orders

  has_one_attached :photo

  validates :name, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :year, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
