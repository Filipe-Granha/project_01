require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction' )
require_relative( '../models/merchant' )
require_relative( '../models/tag' )
require_relative( '../models/thought' )
 




get '/tags/total' do
  @tags = Tag.all
  erb(:"tag/total_tag")
end 

