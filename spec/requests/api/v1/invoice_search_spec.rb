require 'rails_helper'

describe "Invoice search" do

  it "can search for invoice by id" do
   id = create(:invoice).id
   get "/api/v1/invoices/find?id=#{id}"
   invoice = JSON.parse(response.body)
   expect(response).to be_success
   expect(invoice["id"]).to eq(id)
 end

 it "can find by invoice status" do
   status = create(:invoice).status
   get "/api/v1/invoices/find?status=#{status}"
    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice["status"]).to eq(status)
  end

  it "can find all by invoice status" do
    invoice1, invoice2, invoice3 = create_list(:invoice, 3)
    invoice4= create(:invoice, status:"failed")
    get "/api/v1/invoices/find_all?status=#{invoice1.status}"
     invoices = JSON.parse(response.body)
     expect(response).to be_success
     expect(invoices.count).to eq(3)
   end


  it "can find invoice by created at" do
    invoice1 = create(:invoice)
    get "/api/v1/invoices/find?created_at=#{invoice1.created_at}"
    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice["id"]).to eq(invoice1.id)

 end

 it "can find all invoices by created_at" do
    invoice = create(:invoice)
    id = invoice.id
    get "/api/v1/merchants/find?created_at=#{invoice.created_at}"
    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice["id"]).to eq(id)
  end

  it "can find all invoices by updated at" do
    invoice1, invoice2, invoice3 = create_list(:invoice, 3)
    create(:invoice, updated_at:"2013-04-27 14:53:59 UTC")
    get "/api/v1/invoices/find_all?updated_at=#{invoice1.updated_at}"
    invoices = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoices.count).to eq(3)
  end

 it "can find invoice by updated_at" do
    invoice1 = create(:invoice)
    get "/api/v1/invoices/find?updated_at=#{invoice1.updated_at}"
    invoice = JSON.parse(response.body)
    expect(response).to be_success
    expect(invoice["id"]).to eq(invoice1.id)

  end

  it "can find invoice by merchant id" do
    merchant = create(:merchant)
    invoice1= create(:invoice, merchant:merchant)
     get "/api/v1/invoices/find?merchant_id=#{invoice1.merchant_id}"
     invoice = JSON.parse(response.body)
     expect(response).to be_success
     expect(invoice["merchant_id"]).to eq(invoice1.merchant_id)
   end

   it "can find all invoices by merchant id" do
     merchant = create(:merchant)
     invoice1 = create(:invoice, merchant:merchant)
     invoice2 = create(:invoice, merchant:merchant)
     get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"
     invoices = JSON.parse(response.body)
     expect(response).to be_success
     expect(invoice1[:merchant_id]).to eq(merchant.id)
     expect(invoices.count).to eq(2)
    end

    it "can find all invoices by customer id" do
      customer = create(:customer)
      invoice1, invoice2, invoice3 = create_list(:invoice, 3, customer:customer)
       get "/api/v1/invoices/find_all?customer_id=#{customer.id}"
       invoices = JSON.parse(response.body)
       expect(response).to be_success
       expect(invoice1[:customer_id]).to eq(customer.id)
       expect(invoices.count).to eq(3)
     end

     it "can find invoice by customer id" do
       customer = create(:customer)
       invoice= create(:invoice, customer:customer)
        get "/api/v1/invoices/find_all?customer_id=#{customer.id}"
        invoices = JSON.parse(response.body)
        expect(response).to be_success
        expect(invoice[:customer_id]).to eq(customer.id)
        expect(invoices.count).to eq(1)
      end

end
