# json.extract! @instructors

json.instructors do
  json.array! @instructors do |instructor|
    json.instructor_id instructor.id
    json.name instructor.name
    json.date_started instructor.date_started
    json.years_experience instructor.years_experience
    json.certifications instructor.certifications
    json.bio instructor.blurb
    json.verified instructor.verified

    if instructor.sessions.first.activity.present?
      json.activity instructor.sessions.first.activity.title
    end
  end
end
