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
  
  context "get invoice" do
    it "shows an invoice" do
      create :invoice
      get '/api/v1/invoices/1'
      expect(response).to be_success
    end
  end

end
