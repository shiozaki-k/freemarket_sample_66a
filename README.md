# README




## orders table
|Column|Type|Options|
|------|----|-------|
|item_id| refereces|null: false, foreign_key: true|
|user_id| refereces|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item





## comments table
|Column|Type|Options|
|------|----|-------|
|body|text||
|item_id| refereces|null: false, foreign_key: true|
|user_id| refereces|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item



## creditcards table
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|card_month|integer|null: false|
|card_year|integer|null: false|
|security_code|integer|null: false|
|user_id| refereces|null: false, foreign_key: true|


### Association
- belongs_to :user
  


