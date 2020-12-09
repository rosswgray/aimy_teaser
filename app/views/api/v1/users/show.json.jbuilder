json.extract! @user, :id, :name, :is_parent, :is_organizer
json.faved_activities do
  json.array! @user.all_favorited do |fav|
    json.activity_id fav.id
    json.organizer_id fav.user_id
    json.organizer_name fav.organizer.name
    json.activity_title fav.title
    json.main_photo fav.main_photo.service_url
    json.num_of_favs fav.favoritors.length
  end
end
