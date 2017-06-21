require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )
require_relative( '../models/transaction' )
require_relative( '../models/merchant' )
require_relative( '../models/tag' )
require_relative( '../models/thought' )


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
  @merchants = Merchant.all
  @tags = Tag.all
erb(:"transaction/total")
end
# Executes the current_budget method




post '/transactions/:id/delete' do
  Transaction.delete(params[:id])
  redirect to("/transactions")
end 
# Deletes an object from the table through the Delete button





get '/transactions/:id/show' do
  @transaction = Transaction.find(params['id'])
erb(:"transaction/show")
end
 # Shows an individual transaction



get '/transactions/:id/edit' do
 # use find method here
 # use method edit here
erb(:"transaction/show")
end
# Edits a transaction
 



 # post '/transactions/:id' do
 #  # use find method here
 # redirect to '/transactions'
 # end
 #  # Updates a transaction


