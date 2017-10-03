require "rails_helper"

describe "Invoices API" do
  context "get invoices" do
  it "sends a list of invoices" do
    create_list(:invoice, 3)
    get '/api/v1/invoices'
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
    expect(response).to be_success
  end
end
  context "post invoices" do
    it "creates a valid invoice" do
      invoice_params = {customer_id: 1, merchant_id: 1, status: "shippped"}
      post('/api/v1/invoices', params {invoices: [invoice_params]})
      invoice = Invoice.last
      expect(response).to be_success
      expect(invoice.last).to eq(invoice_params[:customer_id][:merchant_id][:status])
    end
  end
end
