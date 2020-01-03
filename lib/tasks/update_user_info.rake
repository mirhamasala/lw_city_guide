# namespace :something do
#   task :greet do
#     puts "hello"
#   end

#   task :say_something do
#     puts :something
#   end

#   task :say_something => :greet do
#     puts :something
#   end

#   task :say_something => [:greet, :another] do
#     puts :something
#   end
# end

task :add_location_to_users => :environment do
  User.all.each do |user|
    client = HTTP.get("https://api.github.com/users/#{user.username}")
    # user.update(location: JSON.parse(client.body.to_s)["location"])
    # user.update(bio: JSON.parse(client.body.to_s)["bio"] )
    attrs = JSON.parse(c.body.to_s)
    user.update(location: attrs[:location], avatar: attrs[:avatar])
  end
end

# We make a get request and then we use the body
# The actually body is just a JSON string
# Adding one request per user isn't good so better to do 24/25

# rake greet
# rake something:say_something
# adding a hash rocket, add a dependency over another task
# rake -T
