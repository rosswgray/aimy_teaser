json.activities do
  json.array! @activities do |activity|
    json.extract! activity, :id, :title, :description, :rating, :latitude, :longitude, :address
    unless activity.main_photo.blank?
      json.main_photo activity.main_photo.service_url
    end
    # json.num_of_favs activity.favoritable_score
    # json.liked activity.favoritor_total
    if activity.sessions.present?
      json.next_session do
        json.session_id activity.sessions.first.id
        json.title activity.sessions.first.title
        json.capacity activity.sessions.first.capacity
        json.bookings activity.sessions.first.bookings.length
        json.date activity.sessions.first.start_time.to_date
        json.start_hour activity.sessions.first.start_time.hour
        json.start_min activity.sessions.first.start_time.min
        json.end_hour activity.sessions.first.end_time.hour
        json.end_min activity.sessions.first.end_time.min
      end
    end

    json.organizer do
      json.organizer_id activity.user_id
      json.name activity.organizer.name
    end
  end
end
