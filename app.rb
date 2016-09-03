require 'sinatra'
require 'blanket'

get "/" do
  "Hello World!"
end

get "/insults/get" do
  "#{Blanket.wrap("http://quandyfactory.com/insult/json").get.insult}"
end

get "/ermahgerd/:string" do
  response = Blanket.wrap("http://ermahgerd.herokuapp.com/ternslert?value1=#{params[:string]}").get.value1
  "#{response.gsub(/\//, "")}"
end
