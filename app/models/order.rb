class Order < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :quantity, presence: true, numericality: { only_integer: true }
end
