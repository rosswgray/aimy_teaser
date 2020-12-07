json.extract! @activity, :id, :title, :main_photo, :photo_1, :photo_2, :photo_3, :description, :rating, :latitude, :longitude, :address
json.main_photo @activity.main_photo.service_url
json.ignore_nil!
json.photo_1 @activity.photo_1.service_url
json.photo_2 @activity.photo_1.service_url
json.photo_3 @activity.photo_1.service_url

json.organizer do
  json.organizer_id @activity.user_id
  json.name @activity.organizer.name
end

json.sessions @sessions do |s|
  json.session_id s.id
  json.extract! s, :title, :price
  json.instructor_id s.instructor.id
  json.instructor_profile_pic s.instructor.profile_pic
  json.instructor_name s.first.instructor.name
  json.date s.start_time.to_date
  json.start_hour s.start_time.hour
  json.start_min s.start_time.min
  json.end_hour s.end_time.hour
  json.end_min s.end_time.min
end
