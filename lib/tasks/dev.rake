task :sample_data  :environment do
  p "Creating sample data"

  if Rails.env.development?
    FollowRequest.destroy_all
    User.destroy_all
  end

12.times do
  name = Faker::Name.first_name.downcase
  u = User.create(
    email: 
    "#{name}@example.com",
    username: name,
    password: "password"
    private:[true,false].sample
  )
end

p "#{user.count} users have been created."
  
users = User.all

users.each do |first_user|
  users.each do |second_user|
    if rand < .75
      first_user.sent_follow_requests.create(
        recipient: second_user,
        status FollowRequest.statuses.keys.sample
      )
    end

    if rand < .75
      second_user.sent_follow_requests.create(
        recipient: first_user,
        status FollowRequest.statuses.keys.sample
      )
    end
end

p "#{FollowRequest.count} follow requests have been created."

users.each do |user|
  rand(15).times do
    photo = user.own_photos.create(
      caption: Faker::Quote.jack_handey
    )


end
