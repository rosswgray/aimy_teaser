json.activities do
  json.array! @activities do |activity|
    json.extract! activity, :id, :title, :description, :rating, :latitude, :longitude, :address
    unless activity.main_photo.blank?
      json.main_photo activity.main_photo.service_url
    end

    json.next_session do
      json.session_id activity.sessions.first.id
      json.title activity.sessions.first.title
      json.price activity.sessions.first.price
      json.instructor_id activity.sessions.first.instructor.id
      # json.instructor_profile_pic activity.sessions.first.instructor.profile_pic
      json.instructor_name activity.sessions.first.instructor.name
      json.date activity.sessions.first.start_time.to_date
      json.start_hour activity.sessions.first.start_time.hour
      json.start_min activity.sessions.first.start_time.min
      json.end_hour activity.sessions.first.end_time.hour
      json.end_min activity.sessions.first.end_time.min
    end

    json.organizer do
      json.organizer_id activity.user_id
      json.name activity.organizer.name
    end
  end
end
