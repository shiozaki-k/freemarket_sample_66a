FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"旭"}
    first_name {"井村"}
    last_furigana {"あさひ"}
    first_furigana {"いむら"}
    birth_year { 1999 }
    birth_month { 10 }
    birth_day  { 2 } 
    phone_number { "0909876543" }


    

  end

  

end