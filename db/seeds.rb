require_relative("../models/merchant")
require_relative("../models/tag")
require_relative("../models/transaction")
require("pry-byebug")


Merchant.delete_all()
Tag.delete_all()
Transaction.delete_all()




merchant1 = Merchant.new({
  "name" => "Lidl"
  })
merchant1.save

merchant2 = Merchant.new({
  "name" => "O2"
  })
merchant2.save

merchant3 = Merchant.new({
  "name" => "Maplin"
  })
merchant3.save

merchant4 = Merchant.new({
  "name" => "Amazon"
  })
merchant4.save

merchant5 = Merchant.new({
  "name" => "Landlord"
  })
merchant5.save

merchant6 = Merchant.new({
  "name" => "Lothian Buses"
  })
merchant6.save

merchant7 = Merchant.new({
  "name" => "Other"
  })
merchant7.save





tag1 = Tag.new({
  "name" => "Food"
  })
tag1.save

tag2 = Tag.new({
  "name" => "House"
  })
tag2.save

tag3 = Tag.new({
  "name" => "Health"
  })
tag3.save

tag4 = Tag.new({
  "name" => "Miscellaneous"
  })
tag4.save





transaction1 = Transaction.new({
  "amount" => 100,
  "day" => "2017-06-02",
  "merchant_id" => merchant7.id,
  "tag_id" => tag3.id
  })
transaction1.save

transaction2 = Transaction.new({
  "amount" => 40,
  "day" => "2017-06-10",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id
  })
transaction2.save

transaction3 = Transaction.new({
  "amount" => 1000,
  "day" => "2017-06-10",
  "merchant_id" => merchant5.id,
  "tag_id" => tag2.id
  })
transaction3.save

transaction4 = Transaction.new({
  "amount" => 108,
  "day" => "2017-06-08",
  "merchant_id" => merchant6.id,
  "tag_id" => tag4.id
  })
transaction4.save

transaction5 = Transaction.new({
  "amount" => 100,
  "day" => "2017-06-17",
  "merchant_id" => merchant4.id,
  "tag_id" => tag3.id
  })
transaction5.save


binding.pry
nil