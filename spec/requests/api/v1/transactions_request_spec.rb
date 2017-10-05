require 'rails_helper'

describe "Transactions API" do
  it "sends a list of transactions" do
    create_list(:transaction, 5)

    get "/api/v1/transactions"
    transactions = JSON.parse(response.body)

    expect(response).to be_success
    expect(transactions.count).to eq(5)
  end

  it "can grab one transaction by id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end

  it "can search for transaction by credit_card_number" do
    transaction = create(:transaction)
    id = transaction.id
    credit_card_number = transaction.credit_card_number

    get "/api/v1/transactions/find?credit_card_number=#{credit_card_number}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end

  it "can search for transaction by result" do
    result = create(:transaction).result

    get "/api/v1/transactions/find?result=#{result}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["result"]).to eq(result)
  end

  it "can search for transaction by invoice_id" do
    invoice_id = create(:transaction).invoice_id

    get "/api/v1/transactions/find?invoice_id=#{invoice_id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["invoice_id"]).to eq(invoice_id)
  end

  it "can search for transaction by created_at" do
    transaction = create(:transaction)
    id = transaction.id

    get "/api/v1/transactions/find?created_at=#{transaction.created_at}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end

  it "can search for transaction by updated_at" do
    transaction = create(:transaction)
    id = transaction.id

    get "/api/v1/transactions/find?updated_at=#{transaction.updated_at}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction["id"]).to eq(id)
  end

  it "can get all transactions by matching id" do
    id = create(:transaction).id

    get "/api/v1/transactions/find_all?id=#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction.first["id"]).to eq(id)
    expect(transaction.count).to eq(1)
  end

  it "can get all transactions by matching credit_card_number" do
    transaction = create(:transaction)
    credit_card_number = transaction.credit_card_number
    id = transaction.id

    get "/api/v1/transactions/find_all?credit_card_number=#{credit_card_number}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction.first["id"]).to eq(id)
    expect(transaction.count).to eq(1)
  end

  it "can get all transactions by matching invoice_id" do
    invoice_id = create(:transaction).invoice_id

    get "/api/v1/transactions/find_all?invoice_id=#{invoice_id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction.first["invoice_id"]).to eq(invoice_id)
    expect(transaction.count).to eq(1)
  end

  it "can get all transactions by matching result" do
    result = create(:transaction).result

    get "/api/v1/transactions/find_all?result=#{result}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction.first["result"]).to eq(result)
    expect(transaction.count).to eq(1)
  end

  it "can get all transactions by matching updated_at" do
    transaction = create(:transaction)
    id = transaction.id

    get "/api/v1/transactions/find_all?updated_at=#{transaction.updated_at}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction.first["id"]).to eq(id)
    expect(transaction.count).to eq(1)
  end

  it "can get all transactions by matching created_at" do
    transaction = create(:transaction)
    id = transaction.id

    get "/api/v1/transactions/find_all?created_at=#{transaction.created_at}"

    transaction = JSON.parse(response.body)

    expect(response).to be_success
    expect(transaction.first["id"]).to eq(id)
    expect(transaction.count).to eq(1)
  end

#   # it "can pull a random record" do
#   #   create_list(:merchant, 5)
#   #
#   #   get "/api/v1/merchants/random"
#   #   merchant = JSON.parse(response.body)
#   #   id = merchant["id"]
#   #
#   #   expect(response).to be_success
#     # 10.times do
#     #   last_id = id
#     #   get "/api/v1/customers/random"
#     #   merchant = JSON.parse(response.body)
#     #   id = customer["id"]
#     #    if id == last_id
#     #      matching = true
#     #    else
#     #      matching = false
#     #    end
#     # end
#   # end
end
