require 'csv'

task :import => [:environment] do

  file = "db/customers.csv"

  CSV.foreach(file, :headers => true) do |row|
    Customer.create!(row.to_h)
  end
end

task :import => [:environment] do

  file = "db/merchants.csv"

  CSV.foreach(file, :headers => true) do |row|
    Merchant.create!(row.to_h)
  end
end

task :import => [:environment] do

  file = "db/invoices.csv"

  CSV.foreach(file, :headers => true) do |row|
    Invoice.create!(row.to_h)
  end
end

task :import => [:environment] do

  file = "db/items.csv"

  CSV.foreach(file, :headers => true) do |row|
    Item.create!(row.to_h)
  end
end

task :import => [:environment] do

  file = "db/invoice_items.csv"

  CSV.foreach(file, :headers => true) do |row|
    InvoiceItem.create!(row.to_h)
  end
end

task :import => [:environment] do

  file = "db/transactions.csv"

  CSV.foreach(file, :headers => true) do |row|
    Transaction.create!(row.to_h)
  end
end
