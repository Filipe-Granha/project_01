require_relative("../db/sql_runner")
require("pg")

class Tag


attr_reader(:id, :name)

def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
end

def save()
sql = "INSERT into tags (name)
VALUES '#{@name} RETURNING *;"
results = SqlRunner.run(sql)
@id = results.first()["id"].to_i
end




end