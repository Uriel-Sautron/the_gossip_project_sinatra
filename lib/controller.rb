require 'bundler'
Bundler.require
require 'gossip'


class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
    redirect '/'
  end

  get '/gossips/:id/' do
    id = params['id'].to_i 
    erb :show, locals: {gossip: Gossip.find(id), index: id}
  end

  get '/gossips/:id/edit/' do
    id = params['id'].to_i 
    erb :edit, locals: {gossip: Gossip.find(id), index: id, gossips: Gossip.all}
  end

  post '/gossips/:id/edit/' do
    id = params['id'].to_i 
    Gossip.update("#{params["gossip_author_edit"]}", "#{params["gossip_content-edit"]} #{params["id"]}")
  end

 

end

