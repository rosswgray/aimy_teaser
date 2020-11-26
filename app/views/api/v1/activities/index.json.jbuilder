json.activities do
  json.array! @activities do |activity|
    json.extract! activity, :title, :photos, :description, :price, :rating, :date, :start_time, :end_time

    json.organizer do
      json.organizer_id activity.user_id
      json.name activity.organizer.name
    end
  end
end

# json.array! @comments do |comment|
#   next if comment.marked_as_spam_by?(current_user)

#   json.body comment.body
#   json.author do
#     json.first_name comment.author.first_name
#     json.last_name comment.author.last_name
#   end
# end

# => [ { "body": "great post...", "author": { "first_name": "Joe", "last_name": "Bloe" }} ]