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
# Will show table with all transactions


get '/transactions/new' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
erb(:"transaction/new")
end
# Should show a form to receive data from user

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect to '/transactions'
end


get '/transactions/total' do
  @total = Transaction.current_budget
erb(:"transaction/total")
end





# get '/students/new' do
#   @houses = House.all
#   erb(:new)
# end

# post '/students' do
#   Student.new(params).save
#   redirect to '/students'
# end

# get '/students/:id' do
#   @student = Student.find(params['id'])
#   erb(:show)
# end

# get '/students/:id/edit' do
#   @houses = House.all
#   @student = Student.find(params['id'])
#   erb(:edit)
# end

# post '/students/:id' do
#   student = Student.new(params)
#   student.update
#   redirect to "/students/#{params['id']}"
# end

# post '/students/:id/delete' do
#   student = Student.find(params['id'])
#   student.delete
#   redirect to '/students'
# end