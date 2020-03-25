FactoryBot.define do

  factory :address do
    last_name_ad       { "ああああ" }
    first_name_ad      { "井村" }
    last_furigana_ad   { "あさひ" }
    first_furigana_ad  { "いむら" }
    postal_code        { "5890098" }
    prefectures        { "大阪" }
    city_name          { "茨木" }
    street_number      { "5455" }
    building_name      { "abe" }
    user_id            { 1 }
  end

end