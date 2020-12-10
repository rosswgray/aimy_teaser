json.bookings do
  json.array! @bookings do |booking|
    json.booking_id booking.id
    json.booked_at booking.created_at.strftime("%Y-%m-%d %H:%M")
    json.activity_id booking.session.activity.id
    json.activty_title booking.session.activity.title
    json.session do
      json.session_id booking.session.id
      json.title booking.session.title
      json.capacity booking.session.capacity
      unless booking.session.instructor.profile_pic.blank?
        json.instructor_pic booking.session.instructor.profile_pic.service_url
      end

      json.short_date booking.session.start_time.strftime("%b %e")
      json.start_time booking.session.start_time.strftime("%H:%M")
      json.end_time booking.session.end_time.strftime("%H:%M")
    end
  end
end
