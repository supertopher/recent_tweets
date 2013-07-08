get '/' do
  erb :index
end

get '/:username' do |username|
  @user = TwitterUser.find_by_username(username)
  @user ||= TwitterUser.create(username: username)
  @tweets = Twitter.user_timeline(username, count: 10)
  erb :tweets
end
