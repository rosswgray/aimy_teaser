# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Single methods for randomization
def random_date
    dates = []
    date_before = Faker::Date.between(from: rand(1..5).days.ago, to: Date.today)
    date_after = Faker::Date.forward(days: rand(1..5))
    dates.push(date_before, date_after)
    return dates.sample
end

def random_price
    array = []
    low = [100, 150, 200, 250, 300].sample
    high = [350, 400, 450, 500, 550, 600, 650, 700].sample
    array.push(low, low, low, low, high)
    return result = array.sample
end

def random_activity
    activities_list = ["breakdancing", "competitive dancing", "dancesport", "freerunning", "gymnastics", "high kick", "parkour", "stunt", "trampolining", "field archery", "gungdo", "badminton", "Padel", "volleyball", "table tennis", "3x3 basketball", "cricket", "softball", "skateboarding", "frisbee", "bicycle", "judo", "soccer", "gym", "golf", "waymarking", "geocaching", "painting", "music", "drama", "lego", "chess", "DIY", "handcrafting", "ballet", "yoga", "cooking", "playing", "language", "coding"]
    return activities_list.sample
end

# Clean the database
Activity.delete_all
User.delete_all
puts "deleting previous seed"

# Generation of users-organizers and activities
# provider = ["yahoo.com", "gmail.com", "outlook.com", "zoho.com"].sample

10.times do
    User.create!(
        name: Faker::Name.unique.name,
        role: "organizer",
        email: Faker::Internet.email,
        password: "password#{Faker::Code.nric}"
    )
end

User.all.each do |x|
    if x.role == "organizer"
        3.times do
            Activity.create!(
            user_id: x.id,
            title: "#{random_activity.capitalize} classes",
            description: "#{Faker::Quote.most_interesting_man_in_the_world} #{Faker::Quote.yoda} #{Faker::Quote.matz}",
            price: random_price,
            rating: rand(1..10),
            date: random_date,
            start_time: rand(9..13),
            end_time: rand(14..18),
            photos: "https://picsum.photos/85")
        end
    end
    puts "1 organizer has been created"
    puts "3 activities has been created"
end

# generation of users-parents
5.times do
    User.create!(
        name: Faker::Name.unique.name,
        role: "parent",
        email: Faker::Internet.email,
        password: "password#{Faker::Code.nric}"
    )
    puts "1 parent has been created"
end

# 10.times do
#     Activity.create!(
#     user_id: ross.id,
#     title: Faker::Artist.name,
#     description: Faker::Lorem.paragraph,
#     price: random_price,
#     rating: rand(1..5),
#     date: random_date
#     )
#     p "1 activity generated"
# end
