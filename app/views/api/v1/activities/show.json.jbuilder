json.extract! @activity, :user_id, :title, :image, :description, :price, :rating, :date, :start_time, :end_time

json.array! @bookings do |b|
  json.extract! b, :user_id, :activity_id, :confirmed

  # json.parent do
  #   json
  # end
end
