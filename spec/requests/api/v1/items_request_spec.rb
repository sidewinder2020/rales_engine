require 'rails_helper'

describe "Items API" do
  it "sends a list of items" do
    create_list(:item, 5)

    get "/api/v1/items"
    items = JSON.parse(response.body)

    expect(response).to be_success
    expect(items.count).to eq(5)
  end

  it "can grab one item by id" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end

  it "can search for item by name" do
    name = create(:item).name

    get "/api/v1/items/find?name=#{name}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["name"]).to eq(name)
  end

  it "can search for item by description" do
    description = create(:item).description

    get "/api/v1/items/find?description=#{description}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["description"]).to eq(description)
  end

  it "can search for item by unit_price" do
    unit_price = create(:item).unit_price

    get "/api/v1/items/find?unit_price=#{unit_price}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["unit_price"]).to eq(unit_price)
  end

  it "can search for item by merchant_id" do
    merchant_id = create(:item).merchant_id

    get "/api/v1/items/find?merchant_id=#{merchant_id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["merchant_id"]).to eq(merchant_id)
  end

#   it "can search for transaction by created_at" do
#     transaction = create(:transaction)
#     id = transaction.id
#
#     get "/api/v1/transactions/find?created_at=#{transaction.created_at}"
#
#     transaction = JSON.parse(response.body)
#
#     expect(response).to be_success
#     expect(transaction["id"]).to eq(id)
#   end
#
#   it "can search for transaction by updated_at" do
#     transaction = create(:transaction)
#     id = transaction.id
#
#     get "/api/v1/transactions/find?updated_at=#{transaction.updated_at}"
#
#     transaction = JSON.parse(response.body)
#
#     expect(response).to be_success
#     expect(transaction["id"]).to eq(id)
#   end
#
#   it "can get all transactions by matching id" do
#     id = create(:transaction).id
#
#     get "/api/v1/transactions/find_all?id=#{id}"
#
#     transaction = JSON.parse(response.body)
#
#     expect(response).to be_success
#     expect(transaction.first["id"]).to eq(id)
#     expect(transaction.count).to eq(1)
#   end
#
#   it "can get all transactions by matching credit_card_number" do
#     credit_card_number = create(:transaction).credit_card_number
#
#     get "/api/v1/transactions/find_all?credit_card_number=#{credit_card_number}"
#
#     transaction = JSON.parse(response.body)
#
#     expect(response).to be_success
#     expect(transaction.first["credit_card_number"]).to eq(credit_card_number)
#     expect(transaction.count).to eq(1)
#   end
#
#   it "can get all transactions by matching invoice_id" do
#     invoice_id = create(:transaction).invoice_id
#
#     get "/api/v1/transactions/find_all?invoice_id=#{invoice_id}"
#
#     transaction = JSON.parse(response.body)
#
#     expect(response).to be_success
#     expect(transaction.first["invoice_id"]).to eq(invoice_id)
#     expect(transaction.count).to eq(1)
#   end
#
#   it "can get all transactions by matching result" do
#     result = create(:transaction).result
#
#     get "/api/v1/transactions/find_all?result=#{result}"
#
#     transaction = JSON.parse(response.body)
#
#     expect(response).to be_success
#     expect(transaction.first["result"]).to eq(result)
#     expect(transaction.count).to eq(1)
#   end
#
#   it "can get all transactions by matching updated_at" do
#     transaction = create(:transaction)
#     id = transaction.id
#
#     get "/api/v1/transactions/find_all?updated_at=#{transaction.updated_at}"
#
#     transaction = JSON.parse(response.body)
#
#     expect(response).to be_success
#     expect(transaction.first["id"]).to eq(id)
#     expect(transaction.count).to eq(1)
#   end
#
#   it "can get all transactions by matching created_at" do
#     transaction = create(:transaction)
#     id = transaction.id
#
#     get "/api/v1/transactions/find_all?created_at=#{transaction.created_at}"
#
#     transaction = JSON.parse(response.body)
#
#     expect(response).to be_success
#     expect(transaction.first["id"]).to eq(id)
#     expect(transaction.count).to eq(1)
#   end
#
# #   # it "can pull a random record" do
# #   #   create_list(:merchant, 5)
# #   #
# #   #   get "/api/v1/merchants/random"
# #   #   merchant = JSON.parse(response.body)
# #   #   id = merchant["id"]
# #   #
# #   #   expect(response).to be_success
# #     # 10.times do
# #     #   last_id = id
# #     #   get "/api/v1/customers/random"
# #     #   merchant = JSON.parse(response.body)
# #     #   id = customer["id"]
# #     #    if id == last_id
# #     #      matching = true
# #     #    else
# #     #      matching = false
# #     #    end
# #     # end
# #   # end
 end
