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





end