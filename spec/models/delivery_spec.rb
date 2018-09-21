require 'rails_helper'
describe Delivery  do
    describe '#create' do
        it "contract_idは空欄不可" do
            delivery = build(:delivery, contract_id: "")
            delivery.valid?
            expect(delivery.errors[:contract_id]).to include("を入力してください")
        end
        it "schedule_dateは空欄不可" do
            delivery = build(:delivery, schedule_date: "")
            delivery.valid?
            expect(delivery.errors[:schedule_date]).to include("を入力してください")
        end
        it "有効" do
            delivery = build(:delivery)
            expect(delivery).to be_valid
        end
    end
end
