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

 ## Comments table
 |Column|Type|Option|
 |---|---|---|
 |comment|text||


 ## Image table
 |Column|Type|Option|
 |---|---|---|
 |image|string||
 
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

 ## Sub_categories table
 |Column|Type|Option|
 |---|---|---|
 |sub_category_name|string||

