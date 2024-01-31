class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :books

  has_one_attached :photo

  validates :username, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

end
