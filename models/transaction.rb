require_relative("../db/sql_runner")
require("pg")

class Transaction


  attr_reader(:id, :amount, :date, :merchant_id, :tag_id)

  def initialize(options)
    @id = options["id"].to_i if options ['id']
    @amount = options["amount"]
    @date = options["date"]
    @merchant_id = options["merchant_id"].to_i
    @tag_id = options["tag_id"].to_i
  end



  def Transaction.all()
    sql = "SELECT * FROM transactions;"
    result_hash = SqlRunner.run(sql)
    return result_hash.map {|transaction| Transaction.new(transaction)}
  end
  # This takes an array of hashes and gives me an array of objects: transforms each hash into an object
  # It allows me to get the rows from the table (hashes) and show them to me in the form of objects


  def save()
    sql = "INSERT into transactions (amount, date, merchant_id, tag_id)
    VALUES ('#{@amount}', '#{@date}', '#{@merchant_id}', '#{@tag_id}') RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first()["id"].to_i
  end


  def self.total_amount_spent
    total = 0
    transactions = self.all # saves the "get all transactions" method into a variable
    transactions.each {|transaction| total+= transaction.amount.to_i} # takes the .amount of each transaction and adds it to the variable total (which starts at 0)
    return total
  end
  # Is being used by the current_budget method


  def self.current_budget()
    budget = 10000
    expenditure = self.total_amount_spent
    amount_available = budget - expenditure
      if (budget > expenditure)
        return "You still have #{amount_available}"
      else
        return "You've already spent more than your budget!"
      end
  end


    def merchant()
      sql = "SELECT * FROM merchants WHERE id = #{@merchant_id}"
      merchant = SqlRunner.run(sql).first
      return Merchant.new(merchant)
    end  
  # One transaction will only have one merchant
  # This is needed in the index.erb!!!!


    def tag()
      sql = "SELECT * FROM tags WHERE id = #{@tag_id};"
      result = SqlRunner.run(sql).first
      return Tag.new(result)
    end
  # One tag will have more than one transaction
  # This is needed in the index.erb!!!!


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
    date,
    merchant_id,
    tag_id
    ) = (
    '#{@amount}',
    '#{@date}',
    '#{merchant_id}',
    '#{tag_id}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end



  









# dá-me um array com objectos lá dentro
def self.transactions_by_tag(tag_id)
  sql = "SELECT * FROM transactions WHERE tag_id = #{tag_id};"
  result_hash = SqlRunner.run(sql)
  return result_hash.map {|transaction| Transaction.new(transaction)}
end
# search transactions by their tags
# the .map will take the array of hashes and allow to transform each hash into something else (an object in this case), and put all the results (objects) inside a new array
# dá-me na mesma as transactions, mas apenas aquelas que corresponderem à tag que eu seleccionar



# capta e soma o .amount de cada transaction que corresponda à tag especificada 
def self.total_spent_by_tag(tag_id)
  total = 0
  transactions = self.transactions_by_tag(tag_id) # calls the method above, saves it to variable
  transactions.each {|transaction| total+= transaction.amount.to_i} #takes each object, gets its .amount and adds it to the total
  return total
end







# def self.spent_by_tag
#   sql = "SELECT tags.name, transactions.amount FROM tags
#   INNER JOIN transactions
#   ON transactions.tag_id = tags.id
#   INNER JOIN merchants
#   ON merchants.id = transactions.merchant_id;"
#   result_hash = SqlRunner.run(sql)
#   return result_hash.map {|tag| Transaction.new(tag)}
# end











end