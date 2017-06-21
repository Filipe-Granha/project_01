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



  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = #{id}"
    result = SqlRunner.run(sql).first
    merchant = Merchant.new(result)
    return merchant
  end




  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end


  def self.delete(id)
     sql = "DELETE FROM merchants where id = #{@id}"
     SqlRunner.run(sql)
  end


  def update()
    sql = "UPDATE merchants SET (name) = ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


end