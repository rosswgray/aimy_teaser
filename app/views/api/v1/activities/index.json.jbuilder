json.activities do
  json.array! @activities do |activity|
    json.extract! activity, :id, :title, :description, :rating, :latitude, :longitude, :address
    json.main_photo activity.main_photo.service_url unless activity.main_photo.blank?

    json.num_of_favs activity.favoritors.length + rand(50..150)

    if activity.sessions.present?
      json.next_session do
        json.session_id activity.sessions.first.id
        json.title activity.sessions.first.title
        json.capacity activity.sessions.first.capacity
        json.bookings activity.sessions.first.bookings.length
        json.day_of_week activity.sessions.first.start_time.strftime("%a")
        json.date activity.sessions.first.start_time.strftime("%b %e")
        json.start_time activity.sessions.first.start_time.strftime("%H:%M")
        json.end_time activity.sessions.first.end_time.strftime("%H:%M")
      end
    end

    json.organizer do
      json.organizer_id activity.user_id
      json.name activity.organizer.name
    end
  end
end
