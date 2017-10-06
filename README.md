# Rails Engine

### Prerequisites to Run Locally

  * [Rails version 5.1.4](http://installrails.com/)

  * [Ruby version 2.4.1](https://www.ruby-lang.org/en/documentation/installation/)

### Running Locally

  * Clone this repo.
  * cd into it
  * ```bundle install```
  then *just* in case:
  * ```bundle```
  * ```rake db:{create,migrate}```
  * ```rake import```
  
  To start your server:
  * ```rails s```
  
### Local Tests

 * ```run rspec```
  
### Spec Harness

* git clone https://github.com/turingschool/rales_engine_spec_harness.git

After cd-ing into the spec file, run:
* ```RUBYOPT="-W0" rake```

# Endpoints
  
There are quite a few API endpoints available. To access any of them, enter http://localhost:3000 if you're running it on a local server via rails s.
Follow the /3000/ with any of the following endpoints:

### Customers:
Valid customer parameters are id, first_name, last_name, created_at, and updated_at.

* GET '/api/v1/customers/random'

* GET '/api/v1/customers/:id/favorite_merchant'

* GET '/api/v1/customers/:id/invoices'

* GET '/api/v1/customers/:id/transactions'

* GET '/api/v1/customers/:id'

* GET '/api/v1/customers/'

* GET '/api/v1/customers/find?parameter=x'

* GET '/api/v1/customers/find_all?parameter=x'

### Invoices:
Valid invoice parameters are id, status, customer_id, merchant_id, created_at, and updated_at.

* GET '/api/v1/invoices/random'

* GET '/api/v1/invoices/:id/customer'

* GET '/api/v1/invoices/:id/invoice_items'

* GET '/api/v1/invoices/:id/items'

* GET '/api/v1/invoices/:id/merchant'

* GET '/api/v1/invoices/:id/transactions'

* GET '/api/v1/invoices/:id'

* GET '/api/v1/invoices/'

* GET '/api/v1/invoices/find?parameter=x'

* GET '/api/v1/invoices/find_all?parameter=x'

### Items:
Valid item parameters are id, name, description, unit_price, created_at, updated_at, and merchant_id.

* GET '/api/v1/items/most_items?quantity=x'

* GET '/api/v1/items/most_revenue?quantity=x'

* GET '/api/v1/items/random'

* GET '/api/v1/items/:id/best_day'

* GET '/api/v1/items/:id/invoice_items'

* GET '/api/v1/items/:id/merchant'

* GET '/api/v1/items/:id'

* GET '/api/v1/items/'

* GET '/api/v1/items/find?parameter=x'

* GET '/api/v1/items/find_all?parameter=x'

### Invoice_Items:
Valid invoice_item parameters are id, item_id, invoice_id, quantity, unit_price, created_at, and updated_at.

* GET '/api/v1/invoice_items/random'

* GET '/api/v1/invoice_items/:id/invoice'

* GET '/api/v1/invoice_items/:id/item'

* GET '/api/v1/invoice_items/:id'

* GET '/api/v1/invoice_items/'

* GET '/api/v1/invoice_items/find?parameter=x'

* GET '/api/v1/invoice_items/find_all?parameter=x'

### Merchants:
Merchant parameters are id, name, created_at, and updated_at.

* GET '/api/v1/merchants/most_items?quantity=x'

* GET '/api/v1/merchants/most_revenue?quantity=x'

* GET '/api/v1/merchants/random'

* GET '/api/v1/merchants/revenue?date=x'

* GET '/api/v1/merchants/:id/customers_with_pending_invoices'

* GET '/api/v1/merchants/:id/favorite_customer'

* GET '/api/v1/merchants/:id/invoices'

* GET '/api/v1/merchants/:id/items'

* GET '/api/v1/merchants/:id/revenue?date=x'

* GET '/api/v1/merchants/:id'

* GET '/api/v1/merchants/'

* GET '/api/v1/merchants/find?parameter=x'

* GET '/api/v1/merchants/find_all?parameter=x'

### Transactions:
Valid transaction parameters are id, invoice_id, credit_card_number, credit_card_expiration_date, result, created_at, and updated_at.

* GET '/api/v1/transactions/random'

* GET '/api/v1/transactions/:id/invoice'

* GET '/api/v1/transactions/:id'

* GET '/api/v1/transactions/'

* GET '/api/v1/transactions/find?parameter=x'

* GET '/api/v1/transactions/find_all?parameter=x'

## Authors

* **Joan Harrington**  - [Github](https://github.com/sidewinder2020)
* **Kali Borkoski** - [Github](https://github.com/JunePaloma)

## Acknowledgments

* Our glorious leaders (Josh Mejia & Cory Westerfield), who light our way with their knowledge and grace
* Sal, the skeleton

### Built With

 * Rails
 * Ruby
 * ActiveRecord
 * Postgresql (better than ActiveRecord on ALL levels)

### Contributing

 * You can't. You aren't important enough, nor do we acknowledge your authority.


