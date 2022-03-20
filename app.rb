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

  get '/bookmarks/new' do
    erb :new_bookmark
  end

  post '/bookmarks' do
    @bookmark_list.add_bookmark(params['title'], params['url'])
    redirect '/bookmarks'
  end
  
  delete '/bookmarks/:id' do
    p "I am in the delete route for /bookmarks/#{params[:id]}"
    @bookmark_list.delete_bookmark(params[:id])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end

=begin
  HTTP Verb	Route	Action	Used For
  GET	'/bookmarks'	index action	index page to display all bookmarks
  GET	'/bookmarks/new'	new action	displays create bookmark form
  POST	'/bookmarks'	create action	creates one bookmark
  GET	'/bookmarks/:id'	show action	displays one bookmark based on ID in the url
  GET	'/bookmarks/:id/edit'	edit action	displays edit form based on ID in the url
  PATCH	'/bookmarks/:id'	update action	modifies an existing bookmark based on ID in the url
  PUT	'/bookmarks/:id'	update action	replaces an existing bookmark based on ID in the url
  DELETE	'/bookmarks/:id'	delete action	deletes one bookmark based on ID in the url 
=end
