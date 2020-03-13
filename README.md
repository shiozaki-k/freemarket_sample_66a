# README

 ## Products　table
 |Column|Type|Option|
 |---|---|---|
 |userID|references||
 |name|string||
 |category|string||
 |price|integer||
 |condetion|string||
 |delivery_status|string||
 |delivery_date|datetime||
 |delivery_charge|integer||
 ||||
 ## Association
 belongs to user
 has_many images
 has_many main_category
 

 ## Users table
 |Column|Type|Option|
 |---|---|---|
 |email|string||
 |password|string||
 |nickname|string||
 |last_name(漢字)|string||
 |first_name(漢字)|string||
 |last_name(カナ)|string||
 |first_name(カナ)|string||
 |birthday|datetime||
 |phone|integer||

 ## Association
 has_many products

 ## Comments table
 |Column|Type|Option|
 |---|---|---|
 |comment|text||


 ## Image table
 |Column|Type|Option|
 |---|---|---|
 |image|string||

 ## Asociation
 belongs to products
 
 ## Addresses table
 |Column|Type|Option|
 |---|---|---|
 |user_id|string||
 |post_number|integer||
 |prefectures|string||
 |city|string||
 |address|string||
 |building_name|string||
 |room_number|integer||

 ## Cards table
 |Column|Type|Option|
 |---|---|---|
 |user_id|references||
 |card_id|references||

 ## Main_categories table
 |Column|Type|Option|
 |---|---|---|
 |category_name|string||

 ## Asociation
 has_many sub_category
 belongs to products

 ## Sub_categories table
 |Column|Type|Option|
 |---|---|---|
 |sub_category_name|string||
 
 ## Asociation
 belongs to main_category

