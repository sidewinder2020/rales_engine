require "rails_helper"

describe "item business intelligence API" do

  it "returns the top x items ranked by total revenue" do
    item1 = create(:item)
    item2 = create(:item)
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    invoice3 = create(:invoice)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice2)
    transaction3 = create(:transaction, invoice: invoice3)
    invoice_item1 = create(:invoice_item, invoice: invoice1, item:item1)
    invoice_item2 = create(:invoice_item, invoice: invoice2, item:item1)
    invoice_item2 = create(:invoice_item, invoice: invoice3, item:item2)

    get "/api/v1/items/most_revenue?quantity=2"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq 2
    expect(items[0]["id"]).to eq(item1.id)
    expect(items[1]["id"]).to eq(item2.id)
  end

  it "returns the top x item items ranked by the total number sold" do
    item1 = create(:item)
    item2 = create(:item)
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    invoice3 = create(:invoice)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice2)
    transaction3 = create(:transaction, invoice: invoice3)
    invoice_item1 = create(:invoice_item, invoice: invoice1, item:item1)
    invoice_item2 = create(:invoice_item, invoice: invoice2, item:item1)
    invoice_item2 = create(:invoice_item, invoice: invoice3, item:item2)

    get "/api/v1/items/most_items?quantity=2"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq 2
    expect(items[0]["id"]).to eq(item1.id)
    expect(items[1]["id"]).to eq(item2.id)

  end

  it "returns the date with the most sales for the given item using the invoice date" do
      customer = create(:customer)
      merchant = create(:merchant)
      item = create(:item, merchant: merchant)
      invoice1 = create(:invoice, customer: customer, merchant: merchant)
      invoice2 = create(:invoice, customer: customer, merchant: merchant, created_at: "2012-03-28 14:53:59.000Z")
      transaction1 = create(:transaction, invoice: invoice1)
      transaction2 = create(:transaction, invoice: invoice2)
      invoice_item1 = create(:invoice_item, invoice: invoice1, item:item, quantity: 10)
      invoice_item2 = create(:invoice_item, invoice: invoice2, item:item)

      get "/api/v1/items/#{item.id}/best_day"

      date = JSON.parse(response.body)

      expect(response).to be_success
      expect(date["best_day"].to_datetime).to eq(invoice1.created_at.to_datetime)
  end

end
