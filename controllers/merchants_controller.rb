 require( 'sinatra' )
 require( 'sinatra/contrib/all' )
 require_relative( '../models/merchant.rb' )

 get '/merchants' do
   @merchants = Merchant.all()
   erb (:"merchant/index")
 end 