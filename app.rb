require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark_list'

class BookmarkManager < Sinatra::Base
  configure :development do
    # :nocov:
    register Sinatra::Reloader
    # :nocov:
  end

  get '/' do
    'Hello World'
  end

  get '/bookmarks' do
    bookmarks = BookmarkList.new
    @list = bookmarks.all.join('<br>')
    erb :bookmarks
  end

  run! if app_file == $0
end
