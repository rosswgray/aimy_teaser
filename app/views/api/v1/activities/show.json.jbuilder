json.extract! @activity, :id, :title, :main_photo, :photo_1, :photo_2, :photo_3, :description, :rating, :latitude, :longitude, :address

json.organizer do
  json.organizer_id @activity.user_id
  json.name @activity.organizer.name
end

json.sessions @sessions do |s|
  json.session_id s.id
  json.extract! s, :title, :price, :address
  json.address s.address
  json.date s.start_time.to_date
  json.start_hour s.start_time.hour
  json.start_min s.start_time.min
  json.end_hour s.end_time.hour
  json.end_min s.end_time.min
end
