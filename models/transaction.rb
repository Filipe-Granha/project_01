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



  def save()
    sql = "INSERT into transactions (amount, day, merchant_id, tag_id)
    VALUES ('#{@amount}', '#{@day}', '#{@merchant_id}', '#{@tag_id}') RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first()["id"].to_i
  end



  def Transaction.all()
    sql = "SELECT * FROM transactions;"
    result_hash = SqlRunner.run(sql)
    return result_hash.map {|transaction| Transaction.new(transaction)}
  end



  def Transaction.delete_all()
    sql = "DELETE FROM transactions"
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
    tag = SqlRunner.run(sql).first
    return Tag.new(tag)
  end  
# One transaction will only have one tag



end