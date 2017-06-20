require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )
require_relative( '../models/transaction' )
require_relative( '../models/merchant' )
require_relative( '../models/tag' )



get '/transactions' do
  @transactions = Transaction.all
erb(:"transaction/index")
end
# Shows table with all transactions


get '/transactions/new' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
erb(:"transaction/new")
end
# Shows a form to receive data from user



post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to '/transactions'
end
# Posts to the database the data inserted on the table



get '/transactions/total' do
  @total = Transaction.current_budget
erb(:"transaction/total")
end
# Executes the current_budget method





