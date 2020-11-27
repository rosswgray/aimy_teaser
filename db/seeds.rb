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

def random_photo
    photos = ['https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3697007927,148268648&fm=26&gp=0.jpg' , 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=266708937,4181130033&fm=26&gp=0.jpg', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1365517084,956365332&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=396141530,2076516179&fm=26&gp=0.jpg', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1152139501,4051271736&fm=26&gp=0.jpg', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2035851909,1599990570&fm=26&gp=0.jpg', 'https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00697-3607.jpg', 'https://ns-strategy.cdn.bcebos.com/ns-strategy/upload/fc_big_pic/part-00768-186.jpg', 'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=24740081,2489409541&fm=26&gp=0.jpg']
    return photos.sample
end

def random_location
    locations = %w[Putuo Changning Jing'an Hongkou Huangpu Xuhui Yangpu Minhang Jiading Baoshan Chongming Pudong]
    return locations.sample
end

def random_capactiy
    capacities = [5, 10, 15, 20]
    return capacities.sample
end

# Clean the database
Activity.delete_all
User.delete_all
puts "deleting previous seed"

# Generation of users-organizers and activities
# provider = ["yahoo.com", "gmail.com", "outlook.com", "zoho.com"].sample

# generation of users: organizers
10.times do
    User.create!(
        name: Faker::Name.unique.name,
        role: "organizer",
        email: Faker::Internet.email,
        password: "password#{Faker::Code.nric}"
    )
end

# generation of users: parents
5.times do
    User.create!(
        name: Faker::Name.unique.name, 
        role: "parent",
        email: Faker::Internet.email,
        password: "password#{Faker::Code.nric}"
    )
    puts "1 parent has been created"
end

User.all.each do |x|
    if x.role == "organizer"
        3.times do
            Activity.create!(
            user_id: x.id,
            title: "#{random_activity.capitalize} classes",
            description: "#{Faker::Quote.most_interesting_man_in_the_world} #{Faker::Quote.yoda} #{Faker::Quote.matz}",
            price: random_price,
            capacity: random_capactiy,
            location: random_location,
            rating: rand(1..3),
            date: random_date,
            start_time: rand(9..13),
            end_time: rand(14..18),
            main_photo: random_photo)
        end
    end
    puts "1 organizer has been created"
    puts "3 activities have been created"
end

# makes an array of the all the parents
parents = []
User.all.each do |user|
    if user.role == 'parent'
        parents.push(user)
    end
end

Activity.all.each do |activity|
    3.times do
        Booking.create(
            user_id: parents.sample.id,
            activity_id: activity.id,
            confirmed: false,
            cancelled: false
        )
    end
    puts "3 bookings have been created for #{activity.title}"
end
