FactoryGirl.define do
    factory :company do
        company_name   "おとん"
        office_name    "本社"
        contact_person "金杉優樹"
        email          "okan@gmail.com"
        tel            "09-0932-1234"
        postcode       "123-1234"
        address_prefecture        "東京都"
        address_city  "渋谷区"
        address_street_number "2-2-2"
        address_after "大きいビル　4階"
    end
end