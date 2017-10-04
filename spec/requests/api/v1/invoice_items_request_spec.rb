require 'rails_helper'

describe "Invoice Items API" do
  it "sends a list of invoice_items" do
    create_list(:invoice_item, 5)

    get "/api/v1/invoice_items"
    invoice_items = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_items.count).to eq(5)
  end

  it "can grab one invoice_item by id" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
  end

  it "can search for invoice_item by item_id" do
    item_id = create(:invoice_item).item_id

    get "/api/v1/invoice_items/find?item_id=#{item_id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["item_id"]).to eq(item_id)
  end

  it "can search for invoice_item by invoice_id" do
    invoice_id = create(:invoice_item).invoice_id

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["invoice_id"]).to eq(invoice_id)
  end

  it "can search for invoice_item by quantity" do
    quantity = create(:invoice_item).quantity

    get "/api/v1/invoice_items/find?quantity=#{quantity}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["quantity"]).to eq(quantity)
  end

  it "can search for invoice_item by unit_price" do
    unit_price = create(:invoice_item).unit_price

    get "/api/v1/invoice_items/find?unit_price=#{unit_price}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["unit_price"]).to eq(unit_price)
  end

  it "can search for invoice_item by created_at" do
    invoice_item = create(:invoice_item)
    id = invoice_item.id

    get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
  end

  it "can search for invoice_item by updated_at" do
    invoice_item = create(:invoice_item)
    id = invoice_item.id

    get "/api/v1/invoice_items/find?updated_at=#{invoice_item.updated_at}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item["id"]).to eq(id)
  end

  it "can get all invoice_items by matching id" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/find_all?id=#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item.first["id"]).to eq(id)
    expect(invoice_item.count).to eq(1)
  end

  it "can get all invoice_items by matching item_id" do
    item_id = create(:invoice_item).item_id

    get "/api/v1/invoice_items/find_all?item_id=#{item_id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item.first["item_id"]).to eq(item_id)
    expect(invoice_item.count).to eq(1)
  end

  it "can get all invoice_items by matching invoice_id" do
    invoice_id = create(:invoice_item).invoice_id

    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice_id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item.first["invoice_id"]).to eq(invoice_id)
    expect(invoice_item.count).to eq(1)
  end

  it "can get all invoice_items by matching unit_price" do
    unit_price = create(:invoice_item).unit_price

    get "/api/v1/invoice_items/find_all?unit_price=#{unit_price}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item.first["unit_price"]).to eq(unit_price)
    expect(invoice_item.count).to eq(1)
  end

  it "can get all invoice_items by matching quantity" do
    quantity = create(:invoice_item).quantity

    get "/api/v1/invoice_items/find_all?quantity=#{quantity}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item.first["quantity"]).to eq(quantity)
    expect(invoice_item.count).to eq(1)
  end

  it "can get all invoice_items by matching updated_at" do
    invoice_item = create(:invoice_item)
    id = invoice_item.id

    get "/api/v1/invoice_items/find_all?updated_at=#{invoice_item.updated_at}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item.first["id"]).to eq(id)
    expect(invoice_item.count).to eq(1)
  end

  it "can get all invoice_items by matching created_at" do
    invoice_item = create(:invoice_item)
    id = invoice_item.id

    get "/api/v1/invoice_items/find_all?created_at=#{invoice_item.created_at}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_success
    expect(invoice_item.first["id"]).to eq(id)
    expect(invoice_item.count).to eq(1)
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
