ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './app/models/link'
class BookmarkManager < Sinatra::Base
  enable :sessions
  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
    # Link.create(url: params[:url], title: params[:title])
    @links = Link.all
    erb :links
  end

   get '/links/new' do
    erb :'links/new'
  end

  post '/add' do
    Link.create(url: params[:url], title: params[:title])
    redirect ('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
