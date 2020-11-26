json.extract! @activity, :title, :photos, :description, :price, :rating, :date, :start_time, :end_time
json.organizer_id @activity.user_id

json.bookings @bookings do |b|
  json.parent_id b.user_id
  json.extract! b, :activity_id, :confirmed
end
