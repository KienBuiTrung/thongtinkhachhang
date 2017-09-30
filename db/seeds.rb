require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(name: "Bùi Trung Kiên", email: "kienbt4@bidv.com.vn", department: "QLNB", password: "12345678", 
	password_confirmation: "12345678", is_admin: true)



csv_text = File.read(Rails.root.join('lib', 'seeds', 'users.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  User.create(row.to_hash)
  puts "saved"
end

puts "Done Seeding!!!"