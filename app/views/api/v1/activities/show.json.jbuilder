json.extract! @activity, :id, :title, :description, :rating, :latitude, :longitude, :address
unless @activity.main_photo.blank?
  json.main_photo @activity.main_photo.service_url
end
unless @activity.photo_1.blank?
  json.photo_1 @activity.photo_1.service_url
end
unless @activity.photo_2.blank?
  json.photo_2 @activity.photo_1.service_url
end
unless @activity.photo_3.blank?
  json.photo_3 @activity.photo_1.service_url
end

json.organizer do
  json.organizer_id @activity.user_id
  json.name @activity.organizer.name
  json.phone_number @activity.organizer.phone_number
end

json.sessions @sessions do |s|
  json.session_id s.id
  json.extract! s, :title, :price
  json.instructor_id s.instructor.id
  # unless s.instructor.profile_pic.blank?
    # json.instructor_pic s.instructor.profile_pic
  # end
  json.capacity s.capacity
  json.bookings s.bookings.length
  json.instructor_name s.instructor.name
  json.date s.start_time.to_date
  json.start_hour s.start_time.hour
  json.start_min s.start_time.min
  json.end_hour s.end_time.hour
  json.end_min s.end_time.min
end
