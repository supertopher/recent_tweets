class TwitterUser < ActiveRecord::Base
  has_many :tweets

  after_create :fetch_tweets

  def fetch_tweets
    twitter_array = Twitter.user_timeline(self.username, count: 10)
    twitter_array.each do |tweet|
      self.tweets << Tweet.create(content: tweet.text)
    end
    return self.tweets
  end
end
