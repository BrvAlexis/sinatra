require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index 
  end
  
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    puts "Ce programme enregistre les données du formulaire"
    params = 
    Gossip.new(params[:author], params[:content]).save
  end



end

