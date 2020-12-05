json.bookings do
  json.array! @bookings do |booking|
    json.booking_id booking.id
    json.booked_at booking.created_at
    json.session_id booking.session.id
    json.title booking.session.title
    json.capacity booking.session.capacity
    json.price booking.session.price
    json.start_hour booking.session.start_time.hour
    json.start_min booking.session.start_time.min
    json.end_hour booking.session.end_time.hour
    json.end_min booking.session.end_time.min

    json.instructor booking.session.instructor

    json.sesssion booking.session
  end
end

# def calc_mins(num)
#   if num >= 0 || num < 10
#     return "0#{num}"
#   else
#     return num
# end
