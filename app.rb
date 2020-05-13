require "twitter"
require "sinatra"
require "sinatra/reloader"
require "./api"
require 'date'

set :bind, '0.0.0.0'
set :sessions, :domain => 'goodmorning.neruneru0419.com'
time = Time.new
client = Twitter::REST::Client.new do |config|
  config.consumer_key    = consumer_key
  config.consumer_secret = consumer_secret
  config.access_token    = access_token
  config.access_token_secret = access_token_secret
end

get "/goodmorning" do
  time = Time.new
  time_h = time.hour.to_s
  time_m = time.min.to_s
  if 7 <= time_h.to_i && time_h.to_i <= 9 then
    if time_h.to_i < 10 then
      time_h = "0" + time_h
    end
    client.update("ねるねるは起床に成功しました(#{time_h}:#{time_m})")
  else
    if time_h.to_i < 10 then
      time_h = "0" + time_h
    end
    client.update("ねるねるは起床に失敗しました(#{time_h}:#{time_m})")
  end
  puts("tweetしました")
end


get "/setting" do
  text = request.body.read
  puts text
end

