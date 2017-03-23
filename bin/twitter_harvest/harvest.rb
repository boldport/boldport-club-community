#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require "twitter"
require "t/rcfile"
require "post"
require 'optparse'

def get_twitter_client
  rcfile = T::RCFile.instance
  if rcfile.empty?
    puts "use `t authorize` to initialize ~/.trc first.."
    exit(1)
  end

  Twitter::REST::Client.new do |config|
    config.consumer_key        = rcfile.active_consumer_key
    config.consumer_secret     = rcfile.active_consumer_secret
    config.access_token        = rcfile.active_token
    config.access_token_secret = rcfile.active_secret
  end
end

def make_post(tweet)
  post = Post.new(nil, nil, tweet.id, tweet.created_at)
  post.twitter_id = tweet.id
  tweet.media.each do |media|
    case media
    when Twitter::Media::Photo
      post.images << media.media_uri_https
    end
  end
  tweet.uris.each do |uri|
    expanded_url = uri.expanded_url.to_s
    if expanded_url.include?('/watch?v=')
      post.youtube_ids << expanded_url.split('v=').last
    end
  end
  post.source_url = tweet.uri
  post.author_name = "@#{tweet.user.screen_name}"
  post.author_url = "https://twitter.com/#{tweet.user.screen_name}"
  post.title = tweet.full_text.split(' http').first
  body = ""
  if post.media?
    post.youtube_ids.each do |youtube_id|
      body += "{% include youtube-embed.html id='#{youtube_id}' %}\n\n"
    end
    post.images.each do |image|
      body += "![image](#{image})\n\n"
    end
  end
  body += "{% include twitter-embed.html id='#{post.twitter_id}' %}\n\n"
  post.body = body
  post
end

def harvest(options)
  client = get_twitter_client
  if options[:id]
    tweets = Array(client.status(options[:id]))
  else
    tweets = client.search("#BoldportClub", options)
  end

  tweets.each do |tweet|
    print "Processing #{tweet.id} [#{tweet.created_at}] .. "
    if tweet.retweet?
      puts "skipping: retweet"
      next
    end
    post = make_post(tweet)
    if post.exists? && !options[:force]
      puts "skipping: post already exists"
      next
    end
    puts "writing: #{post.full_path}"
    post.write
  end
end

options = {
  count: 100, force: false
}
OptionParser.new do |opts|
  opts.banner = "Usage: harvest.rb [options]"
  opts.on("-c", "--count [COUNT]", "The number of tweets to return per page, up to a maximum of 100.") do |value|
    options[:count] = value.to_i
  end
  opts.on("-u", "--until [YYY-MM-DD]", "Returns tweets generated before the given date. Date should be formatted as YYYY-MM-DD.") do |value|
    options[:until] = value
  end
  opts.on("-s", "--since_id [ID]", "Returns results with an ID greater than (that is, more recent than) the specified ID. There are limits to the number of Tweets which can be accessed through the API. If the limit of Tweets has occured since the since_id, the since_id will be forced to the oldest ID available.") do |value|
    options[:since_id] = value
  end
  opts.on("-i", "--id [ID]", "Harvest a particular Tweet by ID") do |value|
    options[:id] = value
  end
  opts.on("-f", "--[no-]force", "Force tweet to be harvested even if exists or no media") do |value|
    options[:force] = value
  end

end.parse!

harvest options
