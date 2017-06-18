require_relative("../db/sql_runner")
require("pg")

class Merchant


  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end




  def save()
    sql = "INSERT into merchants (name)
    VALUES ('#{@name}') RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first()["id"].to_i
  end



  def Merchant.all()
    sql = "SELECT * FROM merchants;"
    result_hash = SqlRunner.run(sql)
    return result_hash.map {|merchant| Merchant.new(merchant)}
  end




  def Merchant.delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run( sql )
  end


end