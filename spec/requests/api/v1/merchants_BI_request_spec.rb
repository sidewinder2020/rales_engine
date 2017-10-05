require "rails_helper"

describe "merchant business intelligence API" do


  it "can return the top x merchants ranked by total revenue" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item = create(:item)
    customer1 = create(:customer)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer1, merchant: merchant1)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice1)
    transaction3 = create(:transaction, invoice: invoice2)
    invoice_item1 = create(:invoice_item, invoice: invoice1, item:item)
    invoice_item2 = create(:invoice_item, invoice: invoice2, item:item)

    get "/api/v1/merchants/most_revenue?quantity=1"


    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants.count).to eq 1
    expect(merchants.first["id"]).to eq(merchant1.id)
    expect(merchants.last["id"]).to_not eq(merchant2.id)
  end

  it "can return the top x merchants ranked by total number of items sold" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item = create(:item)
    customer1 = create(:customer)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer1, merchant: merchant1)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice1)
    transaction3 = create(:transaction, invoice: invoice2)
    invoice_item1 = create(:invoice_item, invoice: invoice1, item:item)
    invoice_item2 = create(:invoice_item, invoice: invoice2, item:item)

    get "/api/v1/merchants/most_items?quantity=1"
    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants.count).to eq 1
    expect(merchants.first["id"]).to eq(merchant1.id)
    expect(merchants.first["id"]).to_not eq(merchant2.id)
  end

  it "can return the total revenue for date x across all merchants" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    item = create(:item)
    customer1 = create(:customer)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer1, merchant: merchant1)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice1)
    transaction3 = create(:transaction, invoice: invoice2)
    invoice_item1 = create(:invoice_item, invoice: invoice1, item:item)
    invoice_item2 = create(:invoice_item, invoice: invoice2, item:item)

    get "/api/v1/merchants/revenue?date=2012-03-27%2014:53:59"
    revenue = JSON.parse(response.body)

    expect(response).to be_success
    expect(revenue).to eq({"total_revenue"=>"2045.25"})

  end

  it "can return the total revenue for a merchant across successful transactions" do
    merchant = create(:merchant)
    item = create(:item)
    customer1 = create(:customer)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant)
    invoice2 = create(:invoice, customer: customer1, merchant: merchant)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice1)
    transaction3 = create(:transaction, invoice: invoice2)
    invoice_item1 = create(:invoice_item, invoice: invoice1, item:item)
    invoice_item2 = create(:invoice_item, invoice: invoice2, item:item)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    revenue = JSON.parse(response.body)

    expect(response).to be_success
    expect(revenue).to eq({"revenue"=>"2045.25"})
  end

  it "can return the total revenue for a merchant for a specific invoice date" do
    merchant = create(:merchant)
    item = create(:item)
    customer1 = create(:customer)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant)
    invoice2 = create(:invoice, customer: customer1, merchant: merchant)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice1)
    transaction3 = create(:transaction, invoice: invoice2)
    invoice_item1 = create(:invoice_item, invoice: invoice1, item:item)
    invoice_item2 = create(:invoice_item, invoice: invoice2, item:item)

    get "/api/v1/merchants/#{merchant.id}/revenue?date=2012-03-27%2014:53:59%20UTC"

    revenue = JSON.parse(response.body)

    expect(response).to be_success
    expect(revenue).to eq({"revenue"=>"2045.25"})
  end

  it "can return the customer with the most successful transactions for a merchant" do
    merchant = create(:merchant)
    customer1 = create(:customer)
    customer2 = create(:customer)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant)
    invoice2 = create(:invoice, customer: customer2, merchant: merchant)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice1)
    transaction3 = create(:transaction, invoice: invoice2)

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(customer1.id)
  end

  # it "can return a collection of customers with invoices that have no successful transactions" do
  #   get "/api/v1/merchants/#{merchant.id}/customers_with_pending_invoices"
  # end


end
