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
books_attributes = [
  {
    name: 'Lord of the Rings - The two towers',
    author: 'J.R.R. Tolkien',
    genre: 'Fantasy',
    year: 1954,
    price: 49,
    quantity: 10,
    user_id: User.first.id, # Connect the book to the first user
    descricao: 'The Two Towers is the second volume of J.R.R. Tolkien\'s high fantasy novel The Lord of the Rings. It is preceded by The Fellowship of the Ring and followed by The Return of the King.'
  },
  {
    name: 'Chronicles of Narnia',
    author: 'C.S. Lewis',
    genre: 'Fantasy',
    year: 1950,
    price: 39,
    quantity: 5,
    descricao: 'The Chronicles of Narnia is a series of seven high fantasy novels by C. S. Lewis. It is considered a classic of children\'s literature and is the author\'s best-known work, having sold over 100 million copies in 47 languages.',
    user_id: User.last.id # Connect the book to the last user
  },
  {
    name: 'Company of no One',
    author: 'Paul Jarvis',
    genre: 'Non-fiction',
    year: 2020,
    price: 25,
    quantity: 2,
    descricao: 'Company of One is a refreshingly new approach centered on staying small and avoiding growth, for any size business. Not as a freelancer who only gets paid on a per piece basis, and not as an entrepreneurial start-up that wants to scale as soon as possible, but as a small business that is deliberately committed to staying that way.',
    user_id: User.first.id # Connect the book to the second user
  },
  {
    name: 'Your Soul is a River',
    author: 'Nikita Gil',
    genre: 'Romance',
    year: 2016,
    price: 35,
    quantity: 20,
    descricao: 'Your Soul is a River is a book that takes you on a beautiful journey through the different emotions of life. It is a collection of poems that will make you feel things you never thought you could feel. It will help you understand the beauty of life and the beauty of love.',
    user_id: User.second.id # Connect the book to the second user
  },
  {
    name: 'The Geometry of Pasta',
    author: 'Caz Hildebrand & Jacob Kenedy',
    genre: 'Cooking',
    year: 2010,
    price: 89,
    quantity: 3,
    descricao: 'The Geometry of Pasta pairs over 100 authentic recipes from acclaimed chef Jacob Kenedy with award-winning designer Caz Hildebrand’s stunning black-and-white designs to reveal the science, history, and philosophy behind spectacular pasta dishes from throughout Italian history.',
    user_id: User.last.id # Connect the book to the last user
  },
  {
    name: 'Meu pé de laranja lima',
    author: 'José Mauro de Vasconcelos',
    genre: 'Drama',
    year: 1968,
    price: 29,
    quantity: 10,
    user_id: User.first.id, # Connect the book to the first user
    descricao: 'Meu Pé de Laranja Lima is a Brazilian novel written by José Mauro de Vasconcelos in 1968. It tells the story of Zezé, a young boy. The novel has been adapted into a film and a TV series.'
  }
]

# Create books
books_attributes.each do |attributes|
  Book.create!(attributes)
end

# add one different image from a url for each book. The images are handled by ActiveStorage
# The images are stored in the public folder
book = Book.find_by(name: 'Lord of the Rings - The two towers')
book.photo.attach(io: URI.open('https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), filename: 'lotr.jpg')

book = Book.find_by(name: 'Chronicles of Narnia')
book.photo.attach(io: URI.open('https://images.unsplash.com/photo-1629992101753-56d196c8aabb?q=80&w=1980&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), filename: 'book2.jpg')

book = Book.find_by(name: 'Company of no One')
book.photo.attach(io: URI.open('https://images.unsplash.com/photo-1621351183012-e2f9972dd9bf?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), filename: 'book3.jpg')

book = Book.find_by(name: 'Your Soul is a River')
book.photo.attach(io: URI.open('https://images.unsplash.com/photo-1511873072108-90dc8b47f9fb?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), filename: 'book4.jpg')

book = Book.find_by(name: 'The Geometry of Pasta')
book.photo.attach(io: URI.open('https://images.unsplash.com/photo-1541528772347-b2e90f1dbe71?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), filename: 'book5.jpg')

book = Book.find_by(name: 'Meu pé de laranja lima')
book.photo.attach(io: URI.open('https://m.media-amazon.com/images/I/6121ro6x1-L._SY466_.jpg'), filename: 'book6.jpg')

puts 'Book seed data created successfully.'
