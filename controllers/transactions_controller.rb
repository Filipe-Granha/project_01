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
  erb(:"transaction/saved")
end
# Posts to the database the data inserted on the table



get '/transactions/total' do
  @current_budget = Transaction.current_budget
  @total = Transaction.total_amount_spent
erb(:"transaction/total")
end
# Executes the current_budget method




get '/transactions/:id' do
 
erb(:"transaction/show")
end
 # Shows an individual transaction



get '/transactions/:id/edit' do
 
erb(:"transaction/show")
end
# Edits a transaction
 



 post '/transactions/:id' do
  
 redirect to '/transactions'
 end
  # Updates a transaction




  post '/transactions/:id/delete' do
   
  redirect to '/transactions'
  end
   # Deletes a transaction