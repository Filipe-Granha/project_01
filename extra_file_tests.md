SCREENING

def initialize(options)
  @id = options['id'].to_i
  @film_id = options['film_id'].to_i
  @start_time = options['start_time']
  @empty_seats = options['empty_seats'].to_i
  end

  def film()
    sql = "SELECT * FROM films WHERE films.id = #{@film_id}"
    film = Film.map_item(sql)
    return film
  end
-------------------------------------------------------------------
TICKET

def initialize(options)
  @id = options['id'].to_i
  @customer_id = options['customer_id'].to_i
  @screening_id = options['screening_id'].to_i
end

def film()
  sql = "SELECT films.* FROM films INNER JOIN screenings ON films.id = screenings.film_id WHERE screenings.id = #{@screening_id}"
  film = Film.map_item(sql)
  return film
end

def customer()
  sql = "SELECT * FROM customers WHERE customers.id = #{@customer_id}"
  customer = Customer.map_item(sql)
  return customer
end
-------------------------------------------------------------------





