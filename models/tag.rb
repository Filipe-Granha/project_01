require_relative("../db/sql_runner")

class Tag


attr_reader(:id, :name)

def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
end





end