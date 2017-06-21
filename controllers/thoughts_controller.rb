require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )
require_relative( '../models/transaction' )
require_relative( '../models/merchant' )
require_relative( '../models/tag' )

get '/thoughts' do
 
  @actions = Action.all
  erb ( :"/thoughts" )
end 