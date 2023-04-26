# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(rut: '18123456-7', name: 'Rodrigo', lastname: 'Rodriguez')
user_2 = User.create(rut: '17123456-7', name: 'Gonzalo', lastname: 'Gonzalez')
user_3 = User.create(rut: '16123456-7', name: 'Fernando', lastname: 'Fernandez')

account_1 = Account.create(user_id: user_1.id, amount: 5000)
account_2 = Account.create(user_id: user_2.id, amount: 10000)
account_3 = Account.create(user_id: user_3.id, amount: 15000)