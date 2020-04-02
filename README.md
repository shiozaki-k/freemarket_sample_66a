# README


## images table

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item


## categories table

|Column|Type|Options|
|------|----|-------|
|name|string|
|ancestry|string|


### Association
- has_many :items



## orders table
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## comments table
|Column|Type|Options|
|------|----|-------|
|body|text||
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item



## creditcards table
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|payjp_id|integer|null: false|



### Association
- belongs_to :user
  



## users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_furigana|string|null: false|
|first_furigana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|phone_number|integer|null: false, unique: true|


## Association
- has_many :items
- has_many :orders
- has_many :comments
- has_many :creditcards
- has_one :address



## addresses table
|Column|Type|Options|
|------|----|-------|
|last_name_ad|string|null: false|
|first_name_ad|string|null: false|
|last_furigana_ad|string|null: false|
|first_furigana_ad|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|city_name|string|null: false|
|street_number|string|null: false|
|building_name|string|null: false|
|user_id|references|null: false, foreign_key: true|

## Association
- belongs_to :user

 ## Items table
 |Column|Type|Options|
 |---|---|---|
 |name|string|null: false, index: true|
 |price|integer|null: false|
 |condition|string|null: false|
 |brand|string|
 |description|text|null: false|
 |shipping_fee|string|null: false|
 |shipping_duration|string|null: false|
 |category_id|references|foreign_key: true|
 |user_id|references|foreign_key: true|
 |order_id|references|foreign_key: true|
 
 ### Association
 - belongs_to :user
 - belongs_to :category
 - has_many :orders
 - has_many :comments
 



 ## Shipping_methods table
 |Column|Type|Options|
 |---|---|---|
 |shipper_delivery|string|
 |item_id|references|foreign_key: true|

 ### Association
 - belongs_to :item


