require 'sinatra'
require 'rubygems'

set :bind, '0.0.0.0'

get '/' do
  erb :home
end

post '/upload' do
  @filename = paramas[:filename]
end