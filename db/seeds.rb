require 'pry'

#pop cust
JSON.parse(File.read('db/seeds/customers.json')).each do |customer|
  Customer.create!(customer)
end

#pop movies
JSON.parse(File.read('db/seeds/movies.json')).each do |movie|
  Movie.create!(movie)
end

#populate rentals for all cust
customers = Customer.all
customers.each do |customer|
  movie = ApplicationController.find_available_movie
  Rental.create!(customer: customer, movie: movie)
end

#CHECK
movies = Movie.all
movies.each do |movie|
  rentals = Rental.where(movie: movie)
  if rentals.length > movie.inventory
    puts "Problem here with calculating available"
  end
end

#CHECK
no_rentals = Customer.select{|c| c.rentals.length < 1 }
if !no_rentals.empty?
  puts "The following customer ids have no rentals: #{no_rentals.each { |c| c.id}}. Please fix."
end
