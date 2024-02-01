# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Define user attributes for seed data:
users_attributes = [
  {
    email: 'user1@mail.com',
    password: 'senha123',
    username: 'user1',
    first_name: 'John',
    last_name: 'Doe'
  },
  {
    email: 'user2@mail.com',
    password: 'senha123',
    username: 'user2',
    first_name: 'Jane',
    last_name: 'Smith'
  },
  {
    email: 'user3@mail.com',
    password: 'senha123',
    username: 'user3',
    first_name: 'Bob',
    last_name: 'Johnson'
  }
]

# Create users using Devise
users_attributes.each do |attributes|
  User.create!(attributes)
end

puts 'Seed users created successfully.'

# Define book atributes for seed data:
# Define book attributes for seed data
books_attributes = [
  {
    name: 'Book 1',
    author: 'Author 1',
    genre: 'History',
    year: 2020,
    price: 20,
    quantity: 5,
    user_id: User.first.id # Connect the book to the first user
  },
  {
    name: 'Book 2',
    author: 'Author 2',
    genre: 'Non-Fiction',
    year: 2018,
    price: 25,
    quantity: 8,
    user_id: User.last.id # Connect the book to the last user
  },
  {
    name: 'Book 3',
    author: 'Author 3',
    genre: 'Fantasy',
    year: 2010,
    price: 10,
    quantity: 15,
    user_id: User.first.id # Connect the book to the second user
  },
  {
    name: 'Book 4',
    author: 'Author 4',
    genre: 'Romance',
    year: 2023,
    price: 59,
    quantity: 20,
    user_id: User.second.id # Connect the book to the second user
  },
  {
    name: 'Book 5',
    author: 'Author 5',
    genre: 'Biography',
    year: 2012,
    price: 35,
    quantity: 5,
    user_id: User.last.id # Connect the book to the last user
  },
]

# Create books
books_attributes.each do |attributes|
  Book.create!(attributes)
end

puts 'Book seed data created successfully.'
