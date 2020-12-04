json.bookings do
  json.array! @bookings do |booking|
    json.extract! booking

    json.session booking.session
  end
end
