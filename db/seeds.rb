# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


    # Activity.create(
    #   title: 'soccer',
    #   description: 'We are a team of dedicated professionals offering children from 3 years-old the opportunity to discover and play soccer in a convenient environement.',
    #   price: 300,
    #   rating: 4
    # )

    # Activity.create(
    #   title: 'tennis',
    #   description: 'Tennis is a very good sport for children, even from 4 years-old. It helps developping motricity and senses, while giving children a taste of performance and socialization',
    #   price: 250,
    #   rating: 3
    # )

    # Activity.create(
    #   title: 'dance',
    #   description: 'Amalya brings dance to children, actually a lot of different dances! Come try and fin a nice way for your children to discover music, its own body and creative soul!',
    #   price: 200,
    #   rating: 5
    # )

    ross = User.create!(name: "Ross", role: "organizer", email: "rosswgray@gmail.com", password: "password12345")
    arnaud = User.create!(name: "Arnaud", role: "parent", email: "gazielly@yahoo.com", password: "password12345")

    Activity.delete_all
    puts "deleting previous seed"

    def random_date
        dates = []
        date_before = Faker::Date.between(from: rand(1..5).days.ago, to: Date.today)
        date_after = Faker::Date.forward(days: rand(1..5))
        dates.push(date_before, date_after)
        return dates.sample
    end

    # p random_date

    def random_price
        array = []
        low = [100, 150, 200, 250, 300].sample
        high = [350, 400, 450, 500, 550, 600, 650, 700].sample
        array.push(low, low, low, low, high)
    return result = array.sample
    end

    10.times do
        Activity.create!(
        user_id: ross.id,
        title: Faker::Artist.name,
        description: Faker::Lorem.paragraph,
        price: random_price,
        rating: rand(1..5),
        date: random_date
        )
        p "1 activity generated"
    end

      # p activity
    # 10.times do
    #   generate_activity
    #   Activity.title
    #   puts "1 activity generated"
    # end