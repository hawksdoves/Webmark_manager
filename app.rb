ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './lib/link'

class Bookmark < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb(:home)
  end

  get '/link/add' do
    erb(:add_link)
  end

  post '/link/add' do
    Link.create(title: params[:title], href: params[:href])
    redirect to('/links')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
