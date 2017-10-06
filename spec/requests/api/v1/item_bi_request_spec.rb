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
  #
  # it "returns the date with the most sales for the given item using the invoice date" do

  # GET /api/v1/items/:id/best_day
  #   it "if there are multiple days with equal number of sales, it retuns the most recent day" do
  #   end
  # end

end
