JSON.parse(File.read('db/seeds/customers.json')).each do |customer|
  Customer.create!(customer)
end

JSON.parse(File.read('db/seeds/movies.json')).each do |movie|
  Movie.create!(movie)
end

customers = Customer.all
customers.each do |customer|
  movie = Movie.find_by("available_inventory > ?", 0 )

  Rental.create(customer: customer, movie: movie)
end
