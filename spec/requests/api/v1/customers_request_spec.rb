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

    get "/api/v1/customers/find?name=#{first_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(customer["first_name"]).to eq(first_name)
  end
  #
  # it "can search for merchant by created_at" do
  #   merchant = create(:merchant)
  #   id = merchant.id
  #
  #   get "/api/v1/merchants/find?created_at=#{merchant.created_at}"
  #
  #   merchant = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(merchant["id"]).to eq(id)
  # end
  #
  # it "can search for merchant by updated_at" do
  #   merchant = create(:merchant)
  #   id = merchant.id
  #
  #   get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"
  #
  #   merchant = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(merchant["id"]).to eq(id)
  # end
  #
  # it "can get all merchants by matching id" do
  #   id = create(:merchant).id
  #
  #   get "/api/v1/merchants/find_all?id=#{id}"
  #
  #   merchant = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(merchant.first["id"]).to eq(id)
  #   expect(merchant.count).to eq(1)
  # end
  #
  # it "can get all merchants by matching name" do
  #   name = create(:merchant).name
  #
  #   get "/api/v1/merchants/find_all?name=#{name}"
  #
  #   merchant = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(merchant.first["name"]).to eq(name)
  #   expect(merchant.count).to eq(1)
  # end
  #
  # it "can get all merchants by matching updated_at" do
  #   merchant = create(:merchant)
  #   id = merchant.id
  #
  #   get "/api/v1/merchants/find_all?updated_at=#{merchant.updated_at}"
  #
  #   merchant = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(merchant.first["id"]).to eq(id)
  #   expect(merchant.count).to eq(1)
  # end
  #
  # it "can get all merchants by matching created_at" do
  #   merchant = create(:merchant)
  #   id = merchant.id
  #
  #   get "/api/v1/merchants/find_all?created_at=#{merchant.created_at}"
  #
  #   merchant = JSON.parse(response.body)
  #
  #   expect(response).to be_success
  #   expect(merchant.first["id"]).to eq(id)
  #   expect(merchant.count).to eq(1)
  # end
  #
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
