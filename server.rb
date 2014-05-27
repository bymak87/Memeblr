require 'sinatra'
require 'rubygems'
require_relative './lib/memeblr.rb'

set :bind, '0.0.0.0'

get '/' do
   # meme = MEMEBLR::GetMeme.new.run
   # @meme = meme.meme
  erb :home
end

post '/' do
  p params
  # url = params[:url]
  # MEMEBLR::AddMeme.run(url)
end

get '/admin' do
  erb :admin
end

post '/admin-admin_view' do
  puts params
  if "shizzy" == params[:username] && "password" == params[:password]
    redirect to '/admin_view'
  # else
  # return "Try again"
    # redirect to '/'
  end
  erb :admin
end

get '/admin_view' do
  erb :admin_view
end

post '/' do
  @url = params[:url]
  erb :home
end
