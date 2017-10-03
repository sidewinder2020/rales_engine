require 'rails_helper'

describe "Customers API" do
  it "sends a list of customers" do
    create_list(:customer, 5)

    get "/api/v1/customers"
    customers = JSON.parse(response.body)

    expect(response).to be_success
    expect(customers.count).to eq(5)
  end

  it "can grab one customer by id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can search for customer by name" do
    first_name = create(:customer).first_name

    get "/api/v1/customers/find?first_name=#{first_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["first_name"]).to eq(first_name)
  end

  it "can search for customer by last_name" do
    last_name = create(:customer).last_name

    get "/api/v1/customers/find?last_name=#{last_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["last_name"]).to eq(last_name)
  end

  it "can search for customer by created_at" do
    customer = create(:customer)
    id = customer.id

    get "/api/v1/customers/find?created_at=#{customer.created_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can search for customer by updated_at" do
    customer = create(:customer)
    id = customer.id

    get "/api/v1/customers/find?updated_at=#{customer.updated_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["id"]).to eq(id)
  end

  it "can get all customers by matching id" do
    id = create(:customer).id

    get "/api/v1/customers/find_all?id=#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer.first["id"]).to eq(id)
    expect(customer.count).to eq(1)
  end

  it "can get all customers by matching first_name" do
    first_name = create(:customer).first_name

    get "/api/v1/customers/find_all?first_name=#{first_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer.first["first_name"]).to eq(first_name)
    expect(customer.count).to eq(1)
  end

  it "can get all customers by matching last_name" do
    last_name = create(:customer).last_name

    get "/api/v1/customers/find_all?last_name=#{last_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer.first["last_name"]).to eq(last_name)
    expect(customer.count).to eq(1)
  end

  it "can get all customers by matching updated_at" do
    customer = create(:customer)
    id = customer.id

    get "/api/v1/customers/find_all?updated_at=#{customer.updated_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer.first["id"]).to eq(id)
    expect(customer.count).to eq(1)
  end

  it "can get all customers by matching created_at" do
    customer = create(:customer)
    id = customer.id

    get "/api/v1/customers/find_all?created_at=#{customer.created_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer.first["id"]).to eq(id)
    expect(customer.count).to eq(1)
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
