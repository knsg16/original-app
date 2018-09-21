require 'rails_helper'
describe Item  do
    describe '#create' do
        it "nameは空欄不可" do
            item = build(:item, name: "")
            item.valid?
            expect(item.errors[:name]).to include("を入力してください")
        end
        
        it "priceは空欄不可" do
            item = build(:item, price: "")
            item.valid?
            expect(item.errors[:price]).to include("を入力してください")
        end
        
        it "nameは50字以下" do
            invalid_name = "a" * 51
            item = build(:item, name: invalid_name)
            item.valid?
            expect(item.errors[:name]).to include("は50文字以内で入力してください")
        end
        
        it "nameとpriceが有効" do
            item = build(:item)
            expect(item).to be_valid
        end
    end
end