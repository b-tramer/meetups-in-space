require 'sinatra'
require_relative 'config/application'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

# ____________________________

get '/meetups' do
  @meetups = Meetup.all
  erb :'meetups/index'
end

get '/meetups/:id' do
  id = params[:id]
  @meetup = Meetup.find(id)
  @meetup_users = @meetup.users
  binding.pry
  erb :'meetups/show'
end

get '/new' do
  erb :'meetups/new'
end

post '/meetups/:id/join' do
  id = params[:id]
  @new_user = MeetupUser.create(meetup_id: id, user_id: current_user.id)
  if !@new_user.errors.full_messages.nil?
    @error = @new_user.errors.full_messages[0]
  end
  binding.pry
  redirect "/meetups/#{id}"
end


post '/submit' do
  name = params['meetup_name']
  description = params['meetup_description']
  location = params['meetup_location']
  date = params['meetup_date']
  time = params['meetup_time']

  if name != ''
    Meetup.create(name: name, description: description, location: location, date: date, time: time)
  else
    redirect '/new'
  end

  redirect '/meetups'
end
