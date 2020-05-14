require "twitter"
require "sinatra"
require "sinatra/reloader"
require "./api"
require 'date'

set :bind, '0.0.0.0'
set :sessions, :domain => 'goodmorning.neruneru0419.com'

def plus_zero(time_string)
  if time_string.to_i < 10 then
    time_string = "0" + time_string
  end

  return time_string
end

time = Time.new
client = Twitter::REST::Client.new do |config|
  config.consumer_key    = consumer_key
  config.consumer_secret = consumer_secret
  config.access_token    = access_token
  config.access_token_secret = access_token_secret
end

get "/goodmorning" do
  time = Time.new
  time_h = plus_zero(time.hour.to_s)
  time_m = plus_zero(time.min.to_s)
  if time_h == "07" && time_h == "08" && time_h == "09" then
    client.update("ねるねるは起床に成功しました(#{time_h}:#{time_m})")
  else
    client.update("ねるねるは起床に失敗しました(#{time_h}:#{time_m})")
  end
  puts("tweetしました")
end


get "/setting" do
  text = request.body.read
  puts text
end

