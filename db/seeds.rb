require_relative("../models/merchant")
require_relative("../models/tag")
require_relative("../models/transaction")
require("pry-byebug")


merchant1 = Merchant.new({
  "name" => "Lidl",
  })


merchant2 = Merchant.new({
  "name" => "O2",
  })


merchant3 = Merchant.new({
  "name" => "Maplin",
  })


merchant4 = Merchant.new({
  "name" => "Amazon",
  })


merchant5 = Merchant.new({
  "name" => "Landlord",
  })


merchant6 = Merchant.new({
  "name" => "Lothian Buses",
  })


merchant7 = Merchant.new({
  "name" => "Other",
  })






tag1 = Tag.new({
  "name" => "Food",
  })


tag2 = Tag.new({
  "name" => "House",
  })


tag3 = Tag.new({
  "name" => "Health",
  })


tag4 = Tag.new({
  "name" => "Miscellaneous",
  })






transaction1 = Transaction.new({
  "amount" => 100,
  "day" => "2017-06-02",
  "merchant_id" => merchant7.id,
  "tag_id" => tag3.id
  })


transaction2 = Transaction.new({
  "amount" => 40,
  "day" => "2017-06-10",
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id
  })


transaction3 = Transaction.new({
  "amount" => 1000,
  "day" => "2017-06-10",
  "merchant_id" => merchant5.id,
  "tag_id" => tag2.id
  })


transaction4 = Transaction.new({
  "amount" => 108,
  "day" => "2017-06-08",
  "merchant_id" => merchant6.id,
  "tag_id" => tag4.id
  })


transaction5 = Transaction.new({
  "amount" => 100,
  "day" => "2017-06-17",
  "merchant_id" => merchant4.id,
  "tag_id" => tag3.id
  })