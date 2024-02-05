require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  
  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params[:gossip_author], params[:gossip_content]).save
    redirect '/'
  end

  get '/gossips/:id' do
    # Récupérer l'ID du potin depuis l'URL
    gossip_id = params['id'].to_i
  
    # Appeler la méthode find de la classe Gossip pour obtenir le gossip correspondant à l'ID
    @gossip = Gossip.find(gossip_id)
  
    # Passer l'ID du potin en tant que variable locale
    @gossip_id = gossip_id
  
    erb :show
  end

    
  

end

