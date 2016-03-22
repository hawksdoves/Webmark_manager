ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'

require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :add_link
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(tag: params[:tag])
    LinkTag.create(:link => link, :tag => tag)
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
