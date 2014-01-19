require 'open-uri'
require 'json'

puts 'Enter an origin and destination to find the distance and travel time between
	the two addresses'
puts 'Please enter the origin address (street #, street name, city, and state) or zip code'

origin = gets
origin = origin.gsub(' ', '+')

puts 'Please enter the destination address (street #, street name, city, and state) or zip code'

destination = gets
destination = destination.gsub(' ', '+')

url = "http://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&sensor=false"

url = url.gsub("\n", '')

json_data = open(url).read
data = JSON.parse(json_data)

duration = data["routes"].first["legs"].first["duration"].values_at("text")
distance = data["routes"].first["legs"].first["distance"].values_at("text")

duration = duration.to_s
duration = duration.gsub("[", "")
duration = duration.gsub("]", "")
duration = duration.gsub('"', "")

distance = distance.to_s
distance = distance.gsub("[", "")
distance = distance.gsub("]", "")
distance = distance.gsub('"', "")

puts "Travel time: " + duration
puts "Distance: " + distance