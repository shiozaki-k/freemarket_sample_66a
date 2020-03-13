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

# フリマアプリ DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|date_of_birth|date|null: false|
|phone|integer|null: false|
|post_code|integer||
|Prefectures|integer||
|ctiy|string||
|address|string||
|building|string||
### Association
  has_many :products
- has_many :comments




## productsテーブル
|Column|Type|Options|
|------|----|-------|
|product_name|string|null: false |
|explanatory text|text|null: false|
|categories|string|null: false|
|brand|string||
|status|string|null: false|
|shipping_charges|string|null: false|
|ordering_source|string|null: false|
|delivery time|string|null: false|
|price|string|null: false|
|user_id|integer|null: false, foreign_key: true|


### Association
  belongs_to :user
- has_many :images
- has_many :comments


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|product_id|integer|null: false, foreign_key: true|

### Association
  belongs_to :product
  

  
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text||
|time|timestamp||
|product_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
  belongs_to :product
- belongs_to :user

  