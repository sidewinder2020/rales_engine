require "rails_helper"

describe "customer business tntelligence API" do

  it "can return the merchant with whom a customer had the most successful transactions" do
    customer = create(:customer)
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    invoice = create(:invoice, customer: customer, merchant: merchant1)
    transaction1 = create(:transaction, invoice: invoice)
    transaction2 = create(:transaction, invoice: invoice)

    get "/api/v1/customers/1/favorite_merchant"

    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants["id"]).to eq(merchant1.id)
  end
end
