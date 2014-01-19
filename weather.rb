require 'open-uri'
require 'json'

puts 'Please enter a city name or zip code to get the current temperature'

location = gets
location = location.gsub(' ', "+")

url = "http://api.openweathermap.org/data/2.5/weather?q=#{location}"

json_data = open(url).read
data = JSON.parse(json_data)

temp = data["main"].values_at("temp")
temp = temp.to_s
temp = temp.gsub("[", "")
temp = temp.gsub("]", "")
temp = temp.to_f
temp = ((temp - 273) * 1.8 ) + 32
temp = '%.1f' % temp

puts temp.to_s + " degrees F"

