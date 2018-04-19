require 'csv'

# puts "Importing countries..."
# CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
#   Country.create! do |country|
#     country.id = row[0]
#     country.name = row[1]
#   end
# end

# puts "Importing states..."
# CSV.foreach(Rails.root.join("states.csv"), headers: true) do |row|
#   State.create! do |state|
#     state.name = row[0]
#     state.country_id = row[2]
#   end
# end

# puts "Importing countries..."
# CSV.foreach(Rails.root.join("country.csv"), headers: true) do |row|
#   Countr.create! do |country|
#     country.id = row[0]
#     country.name = row[2]
#   end
# end

# puts "Importing states..."
# CSV.foreach(Rails.root.join("state.csv"), headers: true) do |row|
#    Stat.create! do |state|
#   	state.id = row[0]
#     state.name = row[1]
#     state.countr_id = row[2]
#    end
# end

puts "Importing cities..."
CSV.foreach(Rails.root.join("city.csv"), headers: true) do |row|
  #if row[2] == 101
  City.create! do |city|
  	city.id = row[0]
    city.name = row[1]
    city.stat_id = row[2]
  end
  # else
  #   puts "other state done"
  # end
end

Admin.create(email: 'superadmin@gmail.com', password: "Password@123", password_confirmation: "Password@123")