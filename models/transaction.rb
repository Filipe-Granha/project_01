require_relative("../db/sql_runner")

class Transaction


attr_reader(:id, :amount, :day, :merchant_id, :tag_id)

def initialize(options)
  @id = ["id"].to_i
  @amount = ["amount"]
  @day = ["day"]
  @merchant_id = ["merchant_id"].to_i
  @tag_id = ["tag_id"].to_i
end





end