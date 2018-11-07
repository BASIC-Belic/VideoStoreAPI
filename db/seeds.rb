require 'pry'
JSON.parse(File.read('db/seeds/customers.json')).each do |customer|
  Customer.create!(customer)
end

JSON.parse(File.read('db/seeds/movies.json')).each do |movie|
  Movie.create!(movie)
end

customers = Customer.all
customers.each do |customer|

  movie = Movie.first
  id = Movie.first.id

  while !(movie.calculate_available > 0)
    id += 1
    movie = Movie.find_by(id: id)
  end

  Rental.create(customer: customer, movie: movie)
end

movies = Movie.all
movies.each do |movie|
  rentals = Rental.where(movie: movie)
  if rentals.length > movie.inventory
    puts "Problem here with calculating available"
  end
end
