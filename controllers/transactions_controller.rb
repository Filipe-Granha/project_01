require('sinatra')
require('sinatra/contrib/all')
require( 'pry-byebug' )
require_relative( '../models/transaction' )
require_relative( '../models/merchant' )
require_relative( '../models/tag' )
require_relative( '../models/thought' )


# Available everywhere, because it's on the Layout
# clicked on View Transactions, from the view Layout.erb
get '/transactions' do
  @transactions = Transaction.all #does or uses this
erb(:"transaction/index")#shows this
end
# Shows table with all transactions



# clicked on Add New Transaction, from the view Layout.erb
# Let's imagine it was clicked after viewing All Transactions
# Available everywhere, because it's on the view Layout.erb
get '/transactions/new' do        # url where we're at
  @transactions = Transaction.all # does or uses this
  @merchants = Merchant.all       # does or uses this
  @tags = Tag.all                 # does or uses this
erb(:"transaction/new")           # the view file that's showing
end
# Shows a form to receive data from user


# clicked on Save Transaction
post '/transactions/saved' do # url where we're at
  transaction = Transaction.new(params) # because it's a Post, it takes the data from the URL to send to the database
  transaction.save                      # saves that data on the URL as a new transaction
  erb(:"transaction/saved")             # the view file that's showing
end
# Posts to the database the data inserted on the table, and shows link to go back to All Transactions




 
# clicked on Your Totals, from anywhere (it's in the view Layout.erb)
get '/transactions/total' do
  @current_budget = Transaction.current_budget
  @total = Transaction.total_amount_spent
  @merchants = Merchant.all
  @tags = Tag.all
erb(:"transaction/total")   # the view file that's showing
end
# Displays and executes those 4 different lines / methods





# clicked on button Delete, when showing All Transactions
post '/transactions/:id/delete' do  # it's a Post, therefore it grabs the data from the URL when the method Delete is executed
  Transaction.delete(params[:id]) #it deletes it, because on the view file Index we're refering to that particular transaction ('for loop')
  redirect to("/transactions") # redirects to viewing All Transactions, without displaying a specific view file
end 
# Deletes an object from the table through the Delete button






# clicked on button Edit, when showing All Transactions
get '/transactions/:id/show' do  #shows that specific transaction, because we're applying the find method
  @transaction = Transaction.find(params['id'])  #shows that specific object transaction
  @merchants = Merchant.all
  @tags = Tag.all
erb(:"transaction/show")  # the view file that's showing
end
 # Shows an individual transaction
 # It has a Yes (takes to /transactions/<%= @transaction.id %>/edit) and a No (takes to /transactions) button


# clicked on Yes on the /transactions/:id/show, saying we want to edit the transaction
get '/transactions/:id/edit' do
 @transaction = Transaction.find(params['id'])
 @merchants = Merchant.all
 @tags = Tag.all
erb(:"transaction/edit")
end
# Edits a transaction
 


# clicked  on update button on the /transactions/:id/edit
 post '/transactions/:id/updated' do # url where we're at
   transaction = Transaction.new(params) # because it's a Post, it takes the data from the URL to send to the database
   transaction.update                     # saves that data on the URL as a new transaction
   erb(:"transaction/updated")             # the view file that's showing
 end
 #  # Updates a transaction

