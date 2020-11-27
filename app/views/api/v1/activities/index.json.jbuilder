json.activities do
  json.array! @activities do |activity|
    json.extract! activity, :id, :title, :capacity, :main_photo, :photos, :description, :price, :rating, :date, :start_time, :end_time

    json.organizer do
      json.organizer_id activity.user_id
      json.name activity.organizer.name
    end
  end
end
