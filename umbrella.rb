require "http"
require "json"

puts "Do yoou need an umbrella? Lets find out!"
puts "Where are you located?"
location = gets.chomp

gmaps_key = ENV.fetch("GMAPS_KEY")
gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=#{gmaps_key}"

raw_gmaps_data = HTTP.get(gmaps_url)
parsed_gmaps_data = JSON.parse(raw_gmaps_data)

results_array = parsed_gmaps_data.fetch("results")
location_hash = results_array.at("address_components")

puts location_hash
