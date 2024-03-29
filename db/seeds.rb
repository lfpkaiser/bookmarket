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
    descricao: 'The Geometry of Pasta pairs over 100 authentic recipes from acclaimed chef Jacob Kenedy with award-winning designer Caz Hildebrands stunning black-and-white designs to reveal the science, history, and philosophy behind spectacular pasta dishes from throughout Italian history.',
    user_id: User.last.id # Connect the book to the last user
  },
  {
    name: 'Meu pé de laranja lima',
    author: 'José Mauro de Vasconcelos',
    genre: 'Mystery',
    year: 1968,
    price: 29,
    quantity: 10,
    user_id: User.first.id, # Connect the book to the first user
    descricao: 'Meu Pé de Laranja Lima is a Brazilian novel written by José Mauro de Vasconcelos in 1968. It tells the story of Zezé, a young boy. The novel has been adapted into a film and a TV series.'
  },
  {
    name: 'Código Limpo',
    author: 'Robert C. Martin',
    genre: 'Children',
    year: 2009,
    price: 120,
    quantity: 12,
    descricao: 'Mesmo um código ruim pode funcionar. Mas se ele não for limpo, pode acabar com uma empresa de desenvolvimento. Perdem-se a cada ano horas incontáveis e recursos importantes devido a um código mal escrito. Mas não precisa ser assim. O renomado especialista em software, Robert C. Martin, apresenta um paradigma revolucionário com “Código limpo: Habilidades Práticas do Agile Software”.',
    user_id: User.second.id # Connect the book to the second user
  },
  {
    name: 'Como Se livrar das drogas',
    author: 'Luís "Gerson" Soares',
    genre: 'Self-help',
    year: 2019,
    price: 5,
    quantity: 11,
    descricao: '"Por que é tão importante para você investir neste livro sobre tratamento para dependentes de drogas para viciado em drogas agora ..."O que é realmente importante agora não é a pequena quantia que você investirá neste livro de tratamento para vicio em drogas para homens e mulheres, mas quanto você perderá se não investir!Entenda que você pode realmente estar perdendo oportunidade de obter um tratamento de vicio em drogas e se livrar do seu vício em drogas com sucesso.Não deixe nada ficar entre você e seu sucesso com a sua vida e descubra os TOP segredos de como dependentes de drogas podem se livrar da dependência de drogas e deiaxar de ser viciado em Drogas de uma vez por todas!Veja bem, quanto tempo as pessoas devem aprender com os maus momentos antes de investir em si mesmas e em seu sucesso na vida?Pense em quanto sua vida pode mudar se você realmente aplicar as TOP estratégias deste e-book sobre drogas. Você pode ter sucesso e ser feliz ao descobir os TOP segredos de como me livrar das drogas de uma maneira incrível!Não consigo imaginar alguém tirando vantagem disso, é absurdo e pode causar muitos problemas se você não tiver todas as informações necessárias contidas neste livro que ensina como se livrar da dependência de drogas!Felizmente, você é uma pessoa inteligente ... caso contrário, não estaria procurando uma maneira de obter as estratégias contidas neste livro para viciados em drogas, sejam eles, mulheres ou homens se livrarem da dependência de drogas ilícitas. E para mostrar minha sinceridade, mostrarei algo que definitivamente adoçará nosso acordo ...',
    user_id: User.last.id # Connect the book to the last user
  },
  {
    name: 'KELLY KEY E O MESTRE TUCA',
    author: 'Kelly Key',
    genre: 'Philosophy',
    year: 2023,
    price: 54,
    quantity: 150,
    descricao: 'Kelly Key e o Mestre Tuca
    Na cozinha vão criar
    Receitinhas saborosas
    Todos vão querer provar!

    Um tempero especial
    Preparado com sabor
    Traga toda a sua família
    E partilhe com amor!',
    user_id: User.first.id # Connect the book to the first user
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
book.photo.attach(io: URI.open('https://m.media-amazon.com/images/W/MEDIAX_849526-T3/images/I/71CqOvbF+2L._SL1500_.jpg'), filename: 'book3.jpg')

book = Book.find_by(name: 'Your Soul is a River')
book.photo.attach(io: URI.open('https://images.unsplash.com/photo-1511873072108-90dc8b47f9fb?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), filename: 'book4.jpg')

book = Book.find_by(name: 'The Geometry of Pasta')
book.photo.attach(io: URI.open('https://images.unsplash.com/photo-1541528772347-b2e90f1dbe71?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), filename: 'book5.jpg')

book = Book.find_by(name: 'Meu pé de laranja lima')
book.photo.attach(io: URI.open('https://m.media-amazon.com/images/I/6121ro6x1-L._SY466_.jpg'), filename: 'book6.jpg')

book = Book.find_by(name: 'Código Limpo')
book.photo.attach(io: URI.open('https://m.media-amazon.com/images/W/MEDIAX_849526-T3/images/I/71dH97FwGbL._SL1500_.jpg'), filename: 'book7.jpg')

book = Book.find_by(name: 'Como Se livrar das drogas')
book.photo.attach(io: URI.open('https://m.media-amazon.com/images/I/61rr20W6bWL._SL1360_.jpg'), filename: 'book8.jpg')

book = Book.find_by(name: 'KELLY KEY E O MESTRE TUCA')
book.photo.attach(io: URI.open('https://img.travessa.com.br/livro/GR/cd/cd8003a3-cdba-45cb-b038-ab890a137f9b.jpg'), filename: 'book9.jpg')



puts 'Book seed data created successfully.'
