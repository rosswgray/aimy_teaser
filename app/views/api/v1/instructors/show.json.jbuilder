json.extract! @instructor, :id, :name, :years_experience, :date_started, :verified, :blurb
unless @instructor.profile_pic.blank?
  json.instructor_pic @instructor.profile_pic.service_url
  if @instructor.sessions.first.activity.present?
    json.activity @instructor.sessions.first.activity.title
  end
end
