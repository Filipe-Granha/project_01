require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')
require_relative('controllers/transactions_controller')

get '/' do
  erb(:index)
end


get '/about_us' do
erb(:"../views/about_us")
end


get '/thoughts' do
 
  @thoughts = Thought.all
  erb ( :"/thoughts" )
end 