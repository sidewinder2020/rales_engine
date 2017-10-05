require 'rails_helper'

describe "Invoice_Items Relationships API" do
  it "returns the associated invoice" do
    invoice1 = create(:invoice)
    item = create(:item)
    invoice_item = create(:invoice_item, invoice: invoice1, item: item)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    invoice = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice["id"]).to eq(invoice1.id)
  end

  it "returns the associated item" do
    invoice = create(:invoice)
    item1 = create(:item)
    invoice_item = create(:invoice_item, invoice: invoice, item: item1)

    get "/api/v1/invoice_items/#{invoice.id}/item"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(item1.id)
  end
end
