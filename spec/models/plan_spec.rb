require 'rails_helper'
describe Plan  do
    describe '#create' do
        it "nameは空欄不可" do
            plan = build(:plan, name: "")
            plan.valid?
            expect(plan.errors[:name]).to include("を入力してください")
        end
        it "priceは空欄不可" do
            plan = build(:plan, price: "")
            plan.valid?
            expect(plan.errors[:price]).to include("を入力してください")
        end
        it "month_quantity_limitは空欄不可" do
            plan = build(:plan, month_quantity_limit: "")
            plan.valid?
            expect(plan.errors[:month_quantity_limit]).to include("を入力してください")
        end
        it "month_delivery_limitは空欄不可" do
            plan = build(:plan, month_delivery_limit: "")
            plan.valid?
            expect(plan.errors[:month_delivery_limit]).to include("を入力してください")
        end
        it "once_quantity_limitは空欄不可" do
            plan = build(:plan, once_quantity_limit: "")
            plan.valid?
            expect(plan.errors[:once_quantity_limit]).to include("を入力してください")
        end
        it "有効" do
            plan = build(:plan)
            expect(plan).to be_valid
        end
    end
end