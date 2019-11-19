# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
   email: 'user@user',
   password: 'useruser',
   last_name: 'test',
   first_name: 'user',
   postal_code: '1234567',
   phone_number: '09012345678',
   first_furigana: 'user',
   last_furigana: 'test',
   address:'大阪府',
)

Admin.create!(
   email: 'admin@admin',
   password: 'adminadmin'
   )