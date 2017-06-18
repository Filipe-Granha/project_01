require_relative("../db/sql_runner")
require("pg")

class Transaction


attr_reader(:id, :amount, :day, :merchant_id, :tag_id)

def initialize(options)
  @id = options["id"].to_i
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


end