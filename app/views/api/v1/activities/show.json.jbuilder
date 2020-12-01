json.extract! @activity, :id, :title, :main_photo, :photo_1, :photo_2, :photo_3, :description, :price, :rating, :latitude, :longitude

json.organizer do
  json.organizer_id @activity.user_id
  json.name @activity.organizer.name
end

json.sessions @sessions do |s|
  json.session_id s.id
  json.extract! s, :title, :start_time, :end_time
end
