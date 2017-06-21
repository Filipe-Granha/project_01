require_relative("../db/sql_runner")
require("pg")

class Tag
 
 
  attr_reader(:id, :name)

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
  end


  def save()
    sql = "INSERT into tags (name)
    VALUES ('#{@name}') RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first()["id"].to_i
  end




  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = #{id}"
    result = SqlRunner.run(sql).first
    tag = Tag.new(result)
    return tag
  end





  def Tag.all()
    sql = "SELECT * FROM tags;"
    result_hash = SqlRunner.run(sql)
    return result_hash.map {|tag| Tag.new(tag)}
  end




  def Tag.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end



  def self.delete(id)
     sql = "DELETE FROM tags where id = #{@id}"
     SqlRunner.run(sql)
  end


  def update()
    sql = "UPDATE tags SET (name) = ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end



end