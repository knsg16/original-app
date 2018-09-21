
FactoryGirl.define do
    factory :plan do
        name "Sプラン"
        price "10000"
        month_quantity_limit "150"
        once_quantity_limit "70"
        month_delivery_limit "3"
    end
end