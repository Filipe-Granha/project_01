require_relative("../db/sql_runner")

class Transaction


attr_reader(:name)

def initialize(options)
  @id = ["id"].to_i
  @amount = ["amount"]
  @date = ["date"]
  @merchant_id = ["merchant_id"].to_i
  @tag_id = ["tag_id"].to_i
end





end