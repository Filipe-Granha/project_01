require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction' )
require_relative( '../models/merchant' )
require_relative( '../models/tag' )

 




get '/tags/total' do
  @tags = Tag.all
  erb(:"tag/total_tag")
end 

