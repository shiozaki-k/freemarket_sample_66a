# README


## users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_furigana|string|null: false|
|first_furigana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone-number|integer|null: false|


## Association
- has_many :items
- has_many :orders
- has_many :comments
- has_many :creditcards
- belongs_to :address



## addresses table
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|city_name|string|null: false|
|street_number|string|null: false|
|building_name|string|null: false|
|user_id|integer|null: false, foreign_key: true|

## Association
- belongs_to :user

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
 - belongs to :user
 - has_many :main_categories
 - has_many :orders

 ## Shipping_methods table
 |Column|Type|Options|
 |---|---|---|
 |shipper_delivery|string|
 |item_id|string|foreign_key: true|

 ### Association
 - belongs to :item
 