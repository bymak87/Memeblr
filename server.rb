require 'sinatra'
require 'rubygems'

set :bind, '0.0.0.0'

get '/' do
  meme = MEMEBLR::GetMeme.new.run
  @meme = meme.meme
  erb :home
end

post '/' do
  @name = params[:username]
  @pass = params[:password]
  @result = MEMEBLR::AdminLogin.run(@username, @password)

  if @result[:success?]
    session[:username] =@result[:username]
    redirect to '/admin_page'
  else
    session[:error] = @result[:error]
    redirect to '/'
  end
end

post '/' do
  @url = params[:url]
  erb :home
end
