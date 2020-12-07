# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create({name: 'mateo'})

Category.create([{name: 'Work'}, {name: 'Exercise'}, {name: 'Commute'}])
Category.create([{name: 'Side Projects'}, {name: 'Learning'}, {name: 'Sleep'}])
Category.create([{name: 'Entertainment'}])

valid_user = User.first
valid_cat = Category.first

Task.create({desc: 'Test Task',time: 2.5, user_id: valid_user.id, category_id: valid_cat.id})
