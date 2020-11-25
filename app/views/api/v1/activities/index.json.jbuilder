json.activities do
  json.array! @activities do |activity|
    json.extract! activity, :user_id, :title, :image, :description, :price, :rating, :date, :start_time, :end_time
  end
end
