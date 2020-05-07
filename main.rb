require "twitter"
require "sinatra"
require "sinatra/reloader"
require 'date'

time = Time.new
client = Twitter::REST::Client.new do |config|
  config.consumer_key    = ENV['MY_CONSUMER_KEY']
  config.consumer_secret = ENV['MY_CONSUMER_SECRET']
  config.access_token    = ENV['MY_ACCESS_TOKEN']
  config.access_token_secret = ENV['MY_ACCESS_TOKEN_SECRET']
end

time_h = time.hour.to_s
time_m = timm.min.to_s
if time_h.to_i < 10 then
  time_h = "0" + time_h
  en
get "/goodmorning" do
  if 7 <= time_h.to_i && time_h.to_i <= 9 then 
    client.update("ねるねるは起床に成功しました(#{time_h}:#{time_m})")
  else
    client.update("ねるねるは起床に失敗しました(#{time_h}:#{time_m})")
  puts("tweetしました")
end

get "/setting" do
    text = request.body.read
    puts text
end

