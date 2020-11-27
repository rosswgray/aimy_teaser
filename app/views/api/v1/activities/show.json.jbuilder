json.extract! @activity, :id, :title, :main_photo, :photos, :description, :capacity, :price, :rating, :date, :start_time, :end_time

json.organizer do
  json.organizer_id @activity.user_id
  json.name @activity.organizer.name
end

json.bookings @bookings do |b|
  json.parent_id b.user_id
  json.extract! b, :activity_id, :confirmed, :cancelled
end
