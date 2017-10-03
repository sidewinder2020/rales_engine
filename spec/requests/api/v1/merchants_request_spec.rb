require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 5)

    get "/api/v1/merchants"
    merchants = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchants.count).to eq(5)
  end

  it "can grab one merchant by id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
  end

  it "can search for merchant by name" do
    name = create(:merchant).name

    get "/api/v1/merchants/find?name=#{name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["name"]).to eq(name)
  end

  it "can search for merchant by created_at" do
    merchant = create(:merchant)
    id = merchant.id

    get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
  end

  it "can search for merchant by updated_at" do
    merchant = create(:merchant)
    id = merchant.id

    get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
  end

  it "can get all merchants by matching id" do
    id = create(:merchant).id

    get "/api/v1/merchants/find_all?id=#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant.first["id"]).to eq(id)
    expect(merchant.count).to eq(1)
  end

  it "can get all merchants by matching name" do
    name = create(:merchant).name

    get "/api/v1/merchants/find_all?name=#{name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant.first["name"]).to eq(name)
    expect(merchant.count).to eq(1)
  end

  it "can get all merchants by matching updated_at" do
    merchant = create(:merchant)
    id = merchant.id

    get "/api/v1/merchants/find_all?updated_at=#{merchant.updated_at}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant.first["id"]).to eq(id)
    expect(merchant.count).to eq(1)
  end

  it "can get all merchants by matching created_at" do
    merchant = create(:merchant)
    id = merchant.id

    get "/api/v1/merchants/find_all?created_at=#{merchant.created_at}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant.first["id"]).to eq(id)
    expect(merchant.count).to eq(1)
  end
end
