FactoryBot.define do
  factory :product do
    name                {"iphone8"}
    price               {"5000"}
    condition           {"新品・未使用"}
    category            {"家電・スマホ・カメラ"}
    brand               {"apple"}
    description         {"最新式です"}
    shipping_fee        {"送料込み（出品者負担）"}
    shipping_origin     {"大阪"}
    shipping_duration   {"１〜２日で発送"}
    user_id             {1}
  end
end