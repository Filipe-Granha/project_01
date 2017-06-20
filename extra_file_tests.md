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



<table>
  <tr>
    <th>Name</th>
    <th></th>
    <th>Type</th>
  </tr>
  <% for zombie in @zombies %>
  <tr>
    <td><%= zombie.name %></td>
    <td>|</td>
    <td><%= zombie.type %></td>
  </tr>
  <% end %>
</table>


<div id="transaction-wrapper">
  <% @transactions.each do |transaction| %>

  <div class="transaction">
    <h3><a href="/transaction/<%= transaction.id %>"></a></h3>
    <p>Amount: <%= transaction.amount %></p>
    <p>Day: <%= transaction.day %></p>
    <p>Merchant: <%= transaction.merchant_id %></p>
    <p>Tag: <%= transaction.tag_id %></p>
  </div>

  <% end %>
</div>