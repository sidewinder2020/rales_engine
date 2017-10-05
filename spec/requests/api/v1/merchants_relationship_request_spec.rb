require 'rails_helper'

describe "Merchants Relationships API" do

  it "returns a collection of associated items" do
    merchant = create(:merchant)
    item1 = create(:item, merchant: merchant)
    item2 = create(:item, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(2)
    expect(items.first["id"]).to eq(item1.id)
    expect(items.last["id"]).to eq(item2.id)
  end

  it "returns a collection of associated items" do
    merchant = create(:merchant)
    invoice1 = create(:invoice, merchant: merchant)
    invoice2 = create(:invoice, merchant: merchant)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    invoices = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoices.count).to eq(2)
    expect(invoices.first["id"]).to eq(invoice1.id)
    expect(invoices.last["id"]).to eq(invoice2.id)
  end
end
