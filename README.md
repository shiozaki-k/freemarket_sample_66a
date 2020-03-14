# README


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
 
 ### Association
 - belongs to :users
 - has_many :main_categories
 - has_many :orders

 ## Shipping_methods
 |Column|Type|Options|
 |---|---|---|
 |shipper_delivery|string|
 |item_id|string|foreign: true|

 ### Association
 - belongs to :items
 

