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

get "/ermahgerd" do
  # verify_token
  puts params
  response = Blanket.wrap("http://ermahgerd.herokuapp.com/ternslert?value1=#{params[:text]}").get.value1
  content_type :json
  {:text => "#{response.gsub(/\//, "")}"}.to_json
end


def verify_token
  status 404 if params[:token] != ENV['SLACK_TOKEN']
end
