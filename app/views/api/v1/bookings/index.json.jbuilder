json.bookings do
  json.array! @bookings do |booking|
    # json.extract! booking

    json.session_id booking.session.id
  end
end
