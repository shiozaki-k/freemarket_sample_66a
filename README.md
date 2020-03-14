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
# DB設計
 ## Items table
 |Column|Type|Options|
 |---|---|---|
 |name|string|null: false|
 |price|integer|null: false|
 |condition|string|null: false|
 |brand|string|
 |description|text|null: false|
 |shipping_fee|string|null: false|
 |shipping_duration|string|null: false|
 |main_category|refereces|foreign_key: true|
 |user_id|refereces|foreign_key: true|
 |order_id|refereces|foreign_key: true|
 
 ### Asociation
 belongs to users
 has_many main_categories
 has_many orders

 ## Shipping_methods
 |Column|Type|Options|
 |---|---|---|
 |shipper_delivery|string|
 |item_id|string|foreign: true|

 ### Asociation
 belongs to items
 

