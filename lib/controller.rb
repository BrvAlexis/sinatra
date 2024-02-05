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

    puts "Debug: ID du potin extrait depuis l'URL - #{gossip_id}"
  
    # Appeler la méthode find de la classe Gossip pour obtenir le gossip correspondant à l'ID
    @gossip = Gossip.find(gossip_id)

    # Afficher le numéro du potin dans le terminal
  puts "Debug: Numéro du potin dans la route /gossips/:id - #{@gossip&.id}"

    erb :show
  end
  

end

