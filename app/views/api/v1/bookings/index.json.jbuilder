json.bookings do
  json.array! @bookings do |booking|
    json.booking_id booking.id
    json.booked_at booking.created_at
    json.activity_id booking.session.activity.id
    json.activty_title booking.session.activity.title
    json.sesssion  do
      json.session_id booking.session.id
      json.title booking.session.title
      json.capacity booking.session.capacity
      json.price booking.session.price
      json.date booking.session.start_time.to_date
      json.start_hour booking.session.start_time.hour
      json.start_min booking.session.start_time.min
      json.end_hour booking.session.end_time.hour
      json.end_min booking.session.end_time.min
    end
    json.instructor booking.session.instructor
  end
end

# def calc_mins(num)
#   if num >= 0 || num < 10
#     return "0#{num}"
#   else
#     return num
# end
