require 'sinatra'
require 'rubygems'
require_relative './lib/memeblr.rb'

set :bind, '0.0.0.0'

get '/' do
  @list = MEMEBLR::ListMemes.new.run
  erb :home
end

post '/' do

  @result = MEMEBLR::AddMeme.new.run(params)
  erb :list
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


