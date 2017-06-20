require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag.rb' )




get '/tags' do
  
erb(:"tag/index")
end


get '/tags/total' do
  
erb(:"tag/total_tag")
end