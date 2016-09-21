require 'twitter'
class Slack2Twitter
  def initialize(consumer_key:, consumer_secret:, access_token:, access_token_secret:, twitter_user_id:)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = consumer_key
      config.consumer_secret     = consumer_secret
      config.access_token        = access_token
      config.access_token_secret = access_token_secret
    end
    @twitter_user_id             = twitter_user_id
  end

  def send_tweet(args = nil)
    return unless args
    msg = args.join(' ')
    return if msg[0] == '_'
    puts "-"*50 + "\n送信\n" + "-"*50 + "\n"
    if @client.update(msg)
      puts "完了\n  #{msg}"
    else
      puts "失敗\n  #{msg}"
    end
  end

  def recieve_activity(activity_name)
    case activity_name
    when :user_timeline
      @client.send(activity_name, @twitter_user_id).map { |m| "#{m.text}" }[0,4]
    when :mentions_timeline, :home_timeline
      @client.send(activity_name).map { |m| "#{m.user.name} => #{m.text}" }[0,4]
    end
  rescue Twitter::Error::TooManyRequests => e
    puts 'リクエスト多すぎて一時的にbanされてるから１５分待ってね'
    puts e
  end

  def show_activity(activity_name)
    puts "-"*50 + "\n#{activity_name}\n" + "-"*50 + "\n"
    puts recieve_activity(activity_name)
  end
end

slack2twitter = Slack2Twitter.new(consumer_key:        ENV['YOUR_CONSUMER_KEY'],
                                  consumer_secret:     ENV['YOUR_CONSUMER_SECRET'],
                                  access_token:        ENV['YOUR_ACCESS_TOKEN'],
                                  access_token_secret: ENV['YOUR_ACCESS_SECRET'],
                                  twitter_user_id:     ENV['YOUR_TWITTER_USER_ID'])

[:home_timeline, :mentions_timeline, :user_timeline].each do |activity_name|
  slack2twitter.show_activity(activity_name)
end

slack2twitter.send_tweet(ARGV)
