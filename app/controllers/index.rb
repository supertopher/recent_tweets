get '/' do
  erb :index
end

get '/:username' do |username|
  @user = TwitterUser.find_by_username(username)
  @user ||= TwitterUser.create(username: username)
  @user.repopulate_tweets if @user.tweets_stale?
  @tweets = @user.tweets
  erb :tweets
end
