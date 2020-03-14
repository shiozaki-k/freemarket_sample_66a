# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
 ## Items table
 |---|---|---|
 |name|string|null: false|
 |price|integer|null: false|
 |condition|string|null: false|
 |brand|string|
 |description|text|null: false|
 |shipping_fee|string|null: false|
 |shipping_duration|string|null: false|
 |main_category(FK)|refereces|
 |user_id(FK)|refereces|
 |order_id(FK)|refereces|
 
 ### Asociation
 belongs to users
 has_many main_categories
 has_many orders

 ## Shipping_methods
 |---|---|---|
 |shipper_delivery|string|
 |item_id(FK)

 ### Asociation
 belongs to items
 

