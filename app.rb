require 'dotenv'
require 'sinatra'
require 'blanket'
Dotenv.load

get "/" do
  "Hello World!"
end

get "/insults/get" do
  "#{Blanket.wrap("http://quandyfactory.com/insult/json").get.insult}"
end

post "/ermahgerd" do
  # verify_token
  message = params[:text].gsub('ternslate ', '')
  response = Blanket.wrap("http://ermahgerd.herokuapp.com/ternslert?value1=#{message}").get.value1
  content_type :json
  {:text => "#{response.gsub(/\//, "")}"}.to_json
end

get "/ermahgerd" do
  # verify_token
  message = params[:text].gsub('ternslate ', '')
  response = Blanket.wrap("http://ermahgerd.herokuapp.com/ternslert?value1=#{message}").get.value1
  content_type :json
  {:text => response, :response_type => "in_channel"}.to_json
end


def verify_token
  status 404 if params[:token] != ENV['SLACK_TOKEN']
end
