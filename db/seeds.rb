# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Loan.destroy_all
Role.destroy_all

admin_role = Role.create(:name =>  "admin")
puts "admin role created" if admin_role
puts "admin user created" if User.create(email: 'admin@admin', name:"admin", password: 'admin1234', roles: [admin_role])
puts "Guilherme user created" if User.create(email: 'guilherme.pelusi@gmail.com', name:"Guilherme Basso Pelusi", password: 'admin1234', roles: [admin_role])
puts "Sonia user created" if User.create(email: 'soniavbasso@gmail.com', name:"Sonia Virginia Basso", password: 'admin1234', roles: [admin_role])

Loan.create(taker: User.first, provider: User.second, value: 50000)
Loan.create(taker: User.first, provider: User.second, value: 70000)
Loan.create(taker: User.second, provider: User.first, value: 30000)
Loan.create(taker: User.second, provider: User.first, value: 20000)

Loan.create(taker: User.first, provider: User.third, value: 50000)
Loan.create(taker: User.first, provider: User.third, value: 70000)
Loan.create(taker: User.third, provider: User.first, value: 30000)
Loan.create(taker: User.third, provider: User.first, value: 20000)

Loan.create(taker: User.third, provider: User.second, value: 50000)
Loan.create(taker: User.third, provider: User.second, value: 70000)
Loan.create(taker: User.second, provider: User.third, value: 30000)
Loan.create(taker: User.second, provider: User.third, value: 20000)