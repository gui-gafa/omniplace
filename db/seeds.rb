# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin_role = Role.create(:name =>  "admin")
puts "admin role created" if admin_role
puts "admin user created" if User.create(email: 'admin@admin', name:"admin", password: 'admin1234', roles: [admin_role])