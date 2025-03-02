#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@master = params[:master]
	@color = params[:color]

	Client.create :name => @username, :phone => @phone, :datestamp => @datetime, :barber => @master, :color => @color

	erb '<h2>Дякую, вас було записано!</h2>'
end


get '/contacts' do
	erb :contacts
end

post '/contacts' do
	@email = params[:email]
	@message = params[:message]
	
	Contact.create :email => @email, :message => @message

	erb '<h2>Дякую, ваше повідомлення відправлено!</h2>'
end