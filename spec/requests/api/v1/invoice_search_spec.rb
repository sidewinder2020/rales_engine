require 'rails_helper'

describe "Invoice search" do

  it "can search for invoice by id" do
   id = create(:invoice).id
   get "/api/v1/invoices/find?id=#{id}"
   invoice = JSON.parse(response.body)
   expect(response).to be_success
   expect(invoice["id"]).to eq(id)
 end

 it "can search for invoice by created_at" do
    invoice = create(:invoice)
    id = invoice.id
    get "/api/v1/merchants/find?created_at=#{invoice.created_at}"
    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice["id"]).to eq(id)
  end
end
