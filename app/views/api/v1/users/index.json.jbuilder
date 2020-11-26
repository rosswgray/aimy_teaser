# non-functioning code for making all users in a JSON

# json.users do
#   if @user.role == 'organizer'
#     json.array! @users do |user|
#       json.extract! organizer, :name, :profile_picture, :email
#       json.organizer_id user.id
#     end
#   elsif @user.role == 'parent'
#     json.array! @users do |user|
#       json.extract! parent, :name, :profile_picture, :email
#       json.parent_id user.id
#     end
#   end
# end
