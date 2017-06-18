require_relative("../db/sql_runner")

class Transaction


attr_reader(:id, :amount, :date, :merchant_id, :tag_id)

def initialize(options)
  @id = ["id"].to_i
  @amount = ["amount"]
  @date = ["date"]
  @merchant_id = ["merchant_id"].to_i
  @tag_id = ["tag_id"].to_i
end





end