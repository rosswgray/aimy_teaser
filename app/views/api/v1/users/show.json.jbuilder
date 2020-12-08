json.extract! @user, :id, :name, :is_parent, :is_organizer

# if @user.role == 'organizer'
#   json.activities @user.activities do |activity|
#     json.extract! activity, :id, :title, :description, :photos, :price, :rating, :date, :start_time, :end_time
#     json.parents activity.bookings do |booking|
#       json.name booking.parent.name
#       json.avatar booking.parent.profile_picture
#     end 
#   end
# else
#   json.activities @user.bookings do |booking|
#     json.extract! booking.activity, :id, :title, :description, :photos, :price, :rating, :date, :start_time, :end_time
#   end
# end
