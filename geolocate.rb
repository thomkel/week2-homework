require 'open-uri'
require 'json'

puts 'Please enter an address (street #, street name, city, and state) or zip code'

location = gets
location = location.gsub(' ', "+")

url = "https://maps.googleapis.com/maps/api/geocode/json?sensor=false&address=#{location}"

json_data = open(url).read
data = JSON.parse(json_data)

lat = data["results"].first["geometry"]["location"].values_at("lat")
lng = data["results"].first["geometry"]["location"].values_at("lng")

lat = lat.to_s
lat = lat.gsub('"', "")
lat = lat.gsub('[', '')
lat = lat.gsub(']', '')

lng = lng.to_s
lng = lng.gsub('"', '')
lng = lng.gsub(']', '')
lng = lng.gsub('[', '')

puts "Latitude: " + lat
puts "Longitude: " + lng