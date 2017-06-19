require_relative("../db/sql_runner")
require("pg")

class Transaction


  attr_reader(:id, :amount, :day, :merchant_id, :tag_id)

  def initialize(options)
    @id = options["id"].to_i if options ['id']
    @amount = options["amount"]
    @day = options["day"]
    @merchant_id = options["merchant_id"].to_i
    @tag_id = options["tag_id"].to_i
  end



  def current_budget()
    budget = 3000
    expenditure = self.total_amount_spent
    amount_available = budget - expenditure
      if (budget > expenditure)
        return "You still have #{amount_available}"
      else
        return "You've already spent more than your budget"
      end
  end




  def save()
    sql = "INSERT into transactions (amount, day, merchant_id, tag_id)
    VALUES ('#{@amount}', '#{@day}', '#{@merchant_id}', '#{@tag_id}') RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first()["id"].to_i
  end




  def self.all()
    sql = "SELECT * FROM transactions;"
    result_hash = SqlRunner.run(sql)
    return result_hash.map {|transaction| Transaction.new(transaction)}
  end
  # This takes an array of hashes and gives me an array of objects: transforms each hash into an object
  # It allows me to get the rows from the table (hashes) and show them to me in the form of objects




  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end




  def self.delete(id)
     sql = "DELETE FROM transactions where id = #{@id}"
     SqlRunner.run(sql)
  end



  def update()
    sql = "UPDATE transactions SET (
    amount,
    day,
    merchant_id,
    tag_id
    ) = (
    '#{@amount}',
    '#{@day}',
    '#{merchant_id}',
    '#{tag_id}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end



  def merchant()
    sql = "SELECT * FROM merchants WHERE id = #{@merchant_id}"
    merchant = SqlRunner.run(sql).first
    return Merchant.new(merchant)
  end  
# One transaction will only have one merchant




  def tag()
    sql = "SELECT * FROM tags WHERE id = #{@tag_id}"
    tag = SqlRunner.run(sql).first #gets an array with one hash, and we select the first (and only) hash
    return Tag.new(tag) #we create a new object from that hash. No need to use map, as it is only one hash
  end  
# One transaction will only have one tag




# Sandy - dá-me um array com objectos lá dentro
def self.transactions_by_tag(tag_id)
  sql = "SELECT * FROM transactions WHERE tag_id = #{@tag_id};"
  result_hash = SqlRunner.run(sql)
  return result_hash.map {|transaction| Transaction.new(transaction)}
end
# search transactions by their tags
# the .map will take the array of hashes and allow to transform each hash into something else (an object in this case), and put all the results (objects) inside a new array
# dá-me na mesma as transactions, mas apenas aquelas que corresponderem à tag que eu seleccionar



# Sandy - capta e soma o .amount de cada transaction que corresponda à tag especificada 
def total_spent_by_tag(tag_id)
  total = 0
  transactions = self.transactions_by_tag(tag_id) # calls the method above, saves it to variable
  transactions.each {|transaction| total+= transaction.amount} #takes each object, gets its .amount and adds it to the total
  return total
end




# Sandy
def self.total_amount_spent
  total = 0
  transactions = self.all # saves the "get all transactions" method into a variable
  transactions.each {|transaction| total+= transaction.amount} # takes the .amount of each transaction and adds it to the variable total (which starts at 0)
  return total
end










end