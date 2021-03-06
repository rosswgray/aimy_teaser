require 'faker'
require 'open-uri'

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

def activity_tags
  categories = %w[sports active cognitive creative art social 'motor skills' individual competitive outdoor indoor 'small group' water]
end

def random_photo
    photos = ['https://picsum.photos/500']
    return photos.sample
end

def random_location
    locations = %w[Putuo Changning Jing'an Hongkou Huangpu Xuhui Yangpu Minhang Jiading Baoshan Chongming Pudong]
    return locations.sample
end

def random_capacity
    capacities = [5, 10, 15, 20]
    return capacities.sample
end

def random_address
  addresses = ["常德路500弄,
  近新闸路", "龙吴路947号, 近百色路", "龙吴路947号, 近百色路", "军工路2000号, 近嫩江路"]
  return addresses.sample
end

# Clean the database
puts "Deleting previous seed..."
Booking.delete_all
Session.delete_all
Activity.delete_all
Instructor.delete_all
User.delete_all
puts "Previous seed deleted!"

wendy = User.create!(name: "Wendy Tseng", is_organizer: true, is_admin: true, is_parent: false, email: 'wendytseng0622@gmail.com', password: '123456')
kyle = User.create!(name: "Kyle Hayes", is_organizer: true, is_admin: true, is_parent: false, email: 'footballshanghai@gmail.com', password: '123456')
ross = User.create!(name: "Ross Gray", is_organizer: true, is_admin: true, is_parent: false, email: 'rosswgray@gmail.com', password: '123456')
arnaud = User.create!(name: "Arnaud G", is_organizer: true, is_admin: true, is_parent: false, email: 'arnaudgazielly@gmail.com', password: '123456')

# generation of users: organizers
10.times do
  user = User.create!(
    name: Faker::Name.unique.name,
    is_organizer: true,
    is_parent: false,
    email: Faker::Internet.email,
    password: "password#{Faker::Code.nric}",
    phone_number: Faker::PhoneNumber.cell_phone,
    )
  puts "organizer #{user.name} has been created"
end

# generation of users: parents
5.times do
  User.create!(
    name: Faker::Name.unique.name, 
    is_organizer: false,
    is_parent: true,
    email: Faker::Internet.email,
    password: "password#{Faker::Code.nric}",
    phone_number: Faker::PhoneNumber.cell_phone
  )
  puts "1 parent has been created"
end

User.all.each do |x|
  if x.is_organizer == true
    3.times do
      activity = Activity.new(
        user_id: x.id,
        title: "#{random_activity.capitalize} classes",
        description: "#{Faker::Quote.most_interesting_man_in_the_world}. #{Faker::Quote.yoda} #{Faker::Quote.matz}",
        price: random_price,
        address: random_address,
        latitude: 31.224361,
        longitude: 121.469170,
        rating: rand(1..3),
        )
      file = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1607329696182&di=3c5d66f40d47bae1f95ed6dbbe5477d1&imgtype=0&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D4217883734%2C2989517866%26fm%3D214%26gp%3D0.jpg'
      activity.main_photo.attach(io: open(file), filename: "#{activity.title}_main")
      activity.photo_1.attach(io: open(file), filename: "#{activity.title}_1")
      activity.photo_2.attach(io: open(file), filename: "#{activity.title}_2")
      activity.photo_3.attach(io: open(file), filename: "#{activity.title}_3")


      activity.save
    end
    puts "3 activities have been created for #{x.name}"
    3.times do
      instructor = Instructor.create(
        user_id: x.id,
        name: Faker::Name.unique.name,
        years_experience: rand(1..10),
        date_started: Date.parse('1st Sep 2012'),
        verified: true
        )
        file = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1607329696182&di=3c5d66f40d47bae1f95ed6dbbe5477d1&imgtype=0&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D4217883734%2C2989517866%26fm%3D214%26gp%3D0.jpg'
        instructor.profile_pic.attach(io: open(file), filename: "#{instructor.id}_pic")
    end
    puts "3 instructors have been created for #{x.name}"
  end
end

# seeds sessions for each activity
Activity.all.each do |activity|
#   p activity.organizer.instructors
  5.times do
    Session.create(
      activity_id: activity.id,
      instructor_id: activity.organizer.instructors.sample.id,
      title: "Wednesday #{activity.title}",
      capacity: random_capacity,
      price: random_price,
      start_time: DateTime.parse('12th Dec 2020 01:00:00 PM'),
      end_time: DateTime.parse('12th Dec 2020 02:00:00 PM')
    )
  end
  puts "5 sessions created for #{activity.title}"
end

# makes an array of the all the parents
parents = []
User.all.each do |user|
  if user.is_parent == true
      parents.push(user)
  end
end

Session.all.each do |session|
  3.times do
    Booking.create(
      user_id: parents.sample.id,
      session_id: Session.all.sample.id,
      confirmed: false,
      cancelled: false
    )
  end
    puts "3 bookings have been created for #{session.activity.title}"
end
