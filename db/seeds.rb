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

def activity_tags
  categories = %w[sports active cognitive creative art social 'motor skills' individual competitive outdoor indoor 'small group' water]
end

def random_photo
    photos = ['https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1326783306,1418284040&fm=15&gp=0.jpg', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3601247738,476745752&fm=15&gp=0.jpg', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2952210967,2903812078&fm=15&gp=0.jpg', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2064454071,2006766602&fm=26&gp=0.jpg', 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4272943212,203755002&fm=26&gp=0.jpg','https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3563627696,876221058&fm=26&gp=0.jpg', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1559584591,903918518&fm=26&gp=0.jpg', 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=34765916,1158085550&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=988181763,2961681634&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1497377693,1489169948&fm=15&gp=0.jpg', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3339855698,1538325319&fm=26&gp=0.jpg', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1455780492,1433340041&fm=15&gp=0.jpg', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3145524176,2802384121&fm=15&gp=0.jpg']
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

# Clean the database
puts "Deleting previous seed..."
Session.delete_all
Activity.delete_all
Instructor.delete_all
User.delete_all
puts "Previous seed deleted!"

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
      Activity.create!(
        user_id: x.id,
        title: "#{random_activity.capitalize} classes",
        description: "#{Faker::Quote.most_interesting_man_in_the_world}. #{Faker::Quote.yoda} #{Faker::Quote.matz}",
        price: random_price,
        latitude: 31.224361,
        longitude: 121.469170,
        rating: rand(1..3),
        main_photo: random_photo
        )
    end
    puts "3 activities have been created for #{x.name}"
    3.times do
      Instructor.create(
        user_id: x.id,
        name: Faker::Name.unique.name,
        years_experience: rand(1..10),
        date_started: Date.parse('1st Sep 2012'),
        verified: true
      )
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
