json.extract! @activity, :id, :title, :description, :rating, :latitude, :longitude, :address

json.main_photo @activity.main_photo.service_url unless @activity.main_photo.blank?
json.photo_1 @activity.photo_1.service_url unless @activity.photo_1.blank?
json.photo_2 @activity.photo_2.service_url unless @activity.photo_2.blank?
json.photo_3 @activity.photo_3.service_url unless @activity.photo_3.blank?

json.num_of_favs @activity.favoritors.length
json.is_faved @user.favorited?(@activity)
json.requirements @activity.requirements

json.organizer do
  json.organizer_id @activity.user_id
  json.name @activity.organizer.name
  json.phone_number @activity.organizer.phone_number
end

json.sessions @sessions do |s|
  json.session_id s.id
  json.extract! s, :title, :price
  json.instructor_id s.instructor.id
  json.instructor_pic s.instructor.profile_pic.service_url unless s.instructor.profile_pic.blank?
  json.capacity s.capacity
  json.bookings s.bookings.length
  json.full s.bookings.length >= s.capacity
  json.instructor_name s.instructor.name
  json.day_of_week s.start_time.strftime("%A")
  json.date s.start_time.strftime("%B %e")
  json.short_date s.start_time.strftime("%b %e")
  json.start_time s.start_time.strftime("%H:%M")
  json.end_time s.end_time.strftime("%H:%M")
end
