require 'rails_helper'
describe Contract  do
    describe '#create' do
        it "company_idは空欄不可" do
            contract = build(:contract, company_id: "")
            contract.valid?
            expect(contract.errors[:company_id]).to include("を入力してください")
        end
        it "plan_idは空欄不可" do
            contract = build(:contract, plan_id: "")
            contract.valid?
            expect(contract.errors[:plan_id]).to include("を入力してください")
        end
        it "applicated_dateは空欄不可" do
            contract = build(:contract, applicated_date: "")
            contract.valid?
            expect(contract.errors[:applicated_date]).to include("を入力してください")
        end
        it "有効" do
            contract = build(:contract)
            expect(contract).to be_valid
        end
    end
end