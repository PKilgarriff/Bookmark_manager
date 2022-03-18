require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark_list'

class BookmarkManager < Sinatra::Base
  configure :development do
    # :nocov:
    register Sinatra::Reloader
    # :nocov:
  end

  before do
    @bookmark_list = BookmarkList.new
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = @bookmark_list.all_bookmarks
    erb :bookmarks
  end

  get '/new-bookmark' do
    erb :new_bookmark
  end

  post '/new-bookmark' do
    @bookmark_list.add_bookmark(params['title'], params['url'])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
