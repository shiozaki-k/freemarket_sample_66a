# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## users table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|integer|null: false|
|surname|string|null: false|
|given_name|string|null: false|
|birthday|string|null: false|

## Association
- has_many :addresses
- has_many :posts
- has_many :comments



## addresses table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|integer|null: false|
|building_name|string|null: false|

## Association
- belongs_to :user



## posts table
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|details|text|null: false|
|category|string|null: false|
|brand_name|string|
|condition|string|null: false|
|delivery_fee|string|null: false|
|shipmnent_location|string|null: false|
|delivery_time|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|delivery_method|string|null: false|

## Association
- belongs_to :user
- has_many :comments
- has_many :images
- has_many :main_categories

## comments table
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|

## Association
- belongs_to :user
- belongs_to :post

## images table
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|

## Association
- belongs_to :post



## main_categories table
|Column|Type|Options|
|------|----|-------|
|main_category|string|null: false|

## Association
- belongs_to :post
- has_many :sub_categories


## sub-categories table
|Column|Type|Options|
|------|----|-------|
|sub_category|string|null: false|

## Association
- belongs_to :main_category
- has_many :sub2_categories

## sub2-categories table
|Column|Type|Options|
|------|----|-------|
|sub2_category|string|null: false|

## Association
- belongs_to :sub_category

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
