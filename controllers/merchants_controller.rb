 require( 'sinatra' )
 require( 'sinatra/contrib/all' )
 require_relative( '../models/merchant.rb' )
 require_relative( '../models/thought' )
 require_relative( '../models/tag' )
 require_relative( '../models/transaction' )



 get '/merchants/total' do
   @merchants = Merchant.all
   erb(:"merchant/total_merchant")
 end 

