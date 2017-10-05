require 'rails_helper'

describe "Invoices Relationships API" do
  it "returns a collection of transactions" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant, customer: customer)
    create_list(:transaction, 5, invoice: invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq 5
  end

  it "returns a collection of invoice_items" do
    invoice = create(:invoice)
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)
    invoice_item1 = create(:invoice_item, invoice: invoice, item: item1)
    invoice_item2 = create(:invoice_item, invoice: invoice, item: item2)
    invoice_item3 = create(:invoice_item, invoice: invoice, item: item3)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq 3
  end

  it "returns a collection of items" do
    invoice = create(:invoice)
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)
    invoice_item1 = create(:invoice_item, invoice: invoice, item: item1)
    invoice_item2 = create(:invoice_item, invoice: invoice, item: item2)
    invoice_item3 = create(:invoice_item, invoice: invoice, item: item3)

    get "/api/v1/invoices/#{invoice.id}/items"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq 3
  end

  it "returns the associated customer" do
    customer1 = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant: merchant, customer: customer1)

    get "/api/v1/invoices/#{invoice.id}/customer"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq customer1.id
  end

  it "returns the associated merchant" do
    customer = create(:customer)
    merchant1 = create(:merchant)
    invoice = create(:invoice, merchant: merchant1, customer: customer)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(merchant1.id)
  end
end
