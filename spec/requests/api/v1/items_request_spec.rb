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

  it "can search for item by created_at" do
    item = create(:item)
    id = item.id

    get "/api/v1/items/find?created_at=#{item.created_at}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end

  it "can search for item by updated_at" do
    item = create(:item)
    id = item.id

    get "/api/v1/items/find?updated_at=#{item.updated_at}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item["id"]).to eq(id)
  end

  it "can get all items by matching id" do
    id = create(:item).id

    get "/api/v1/items/find_all?id=#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.first["id"]).to eq(id)
    expect(item.count).to eq(1)
  end

  it "can get all items by matching name" do
    name = create(:item).name

    get "/api/v1/items/find_all?name=#{name}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.first["name"]).to eq(name)
    expect(item.count).to eq(1)
  end

  it "can get all items by matching description" do
    description = create(:item).description

    get "/api/v1/items/find_all?description=#{description}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.first["description"]).to eq(description)
    expect(item.count).to eq(1)
  end

  it "can get all items by matching unit_price" do
    unit_price = create(:item).unit_price

    get "/api/v1/items/find_all?unit_price=#{unit_price}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.first["unit_price"]).to eq(unit_price)
    expect(item.count).to eq(1)
  end

  it "can get all items by matching merchant_id" do
    merchant_id = create(:item).merchant_id

    get "/api/v1/items/find_all?merchant_id=#{merchant_id}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.first["merchant_id"]).to eq(merchant_id)
    expect(item.count).to eq(1)
  end

  it "can get all items by matching updated_at" do
    item = create(:item)
    id = item.id

    get "/api/v1/items/find_all?updated_at=#{item.updated_at}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.first["id"]).to eq(id)
    expect(item.count).to eq(1)
  end

  it "can get all items by matching created_at" do
    item = create(:item)
    id = item.id

    get "/api/v1/items/find_all?created_at=#{item.created_at}"

    item = JSON.parse(response.body)

    expect(response).to be_success
    expect(item.first["id"]).to eq(id)
    expect(item.count).to eq(1)
  end

  # it "can pull a random record" do
  #   create_list(:merchant, 5)
  #
  #   get "/api/v1/merchants/random"
  #   merchant = JSON.parse(response.body)
  #   id = merchant["id"]
  #
  #   expect(response).to be_success
    # 10.times do
    #   last_id = id
    #   get "/api/v1/customers/random"
    #   merchant = JSON.parse(response.body)
    #   id = customer["id"]
    #    if id == last_id
    #      matching = true
    #    else
    #      matching = false
    #    end
    # end
  # end
 end
