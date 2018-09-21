# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    id "1"
    email "kana@okan.jp"
    username "金杉優樹"
    authority "1"
    password "aaaaaaaaa"
  end
  
  factory :admin do
    id "2"
    email "k@okan.jp"
    username "金杉優樹"
    authority "1"
    password "aaaaaaaaa"
  end
end
