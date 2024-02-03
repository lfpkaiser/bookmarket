class Order < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_many :order_items

  validates :quantity, presence: true, numericality: { only_integer: true }
end
