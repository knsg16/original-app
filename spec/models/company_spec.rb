require 'rails_helper'
describe Company  do
    describe '#create' do
        it "company_nameは空欄不可" do
            company = build(:company, company_name: "")
            company.valid?
            expect(company.errors[:company_name]).to include("を入力してください")
        end
        it "office_nameは空欄不可" do
            company = build(:company, office_name: "")
            company.valid?
            expect(company.errors[:office_name]).to include("を入力してください")
        end
        it "contact_personは空欄不可" do
            company = build(:company, contact_person: "")
            company.valid?
            expect(company.errors[:contact_person]).to include("を入力してください")
        end
        it "emailは空欄不可" do
            company = build(:company, email: "")
            company.valid?
            expect(company.errors[:email]).to include("を入力してください")
        end
        it "telは空欄不可" do
            company = build(:company, tel: "")
            company.valid?
            expect(company.errors[:tel]).to include("を入力してください")
        end
        it "postcodeは空欄不可" do
            company = build(:company, postcode: "")
            company.valid?
            expect(company.errors[:postcode]).to include("を入力してください")
        end
        it "address_prefectureは空欄不可" do
            company = build(:company, address_prefecture: "")
            company.valid?
            expect(company.errors[:address_prefecture]).to include("を入力してください")
        end
        it "address_cityは空欄不可" do
            company = build(:company, address_city: "")
            company.valid?
            expect(company.errors[:address_city]).to include("を入力してください")
        end
        it "address_street_numberは空欄不可" do
            company = build(:company, address_street_number: "")
            company.valid?
            expect(company.errors[:address_street_number]).to include("を入力してください")
        end
        it "company_nameは100文字以下" do
            invalid_company_name = "a" * 101
            company = build(:company, company_name: invalid_company_name)
            company.valid?
            expect(company.errors[:company_name]).to include("は100文字以内で入力してください")
        end
        it "office_nameは45文字以下" do
            invalid_office_name = "a" * 46
            company = build(:company, office_name: invalid_office_name)
            company.valid?
            expect(company.errors[:office_name]).to include("は45文字以内で入力してください")
        end
        it "contact_personは45文字以下" do
            invalid_contact_person = "a" * 46
            company = build(:company, contact_person: invalid_contact_person)
            company.valid?
            expect(company.errors[:contact_person]).to include("は45文字以内で入力してください")
        end
        it "address_prefectureは45文字以下" do
            invalid_address_prefecutre = "a" * 46
            company = build(:company, address_prefecture: invalid_address_prefecutre)
            company.valid?
            expect(company.errors[:address_prefecture]).to include("は45文字以内で入力してください")
        end
        it "address_cityは45文字以下" do
            invalid_address_city = "a" * 46
            company = build(:company, address_city: invalid_address_city)
            company.valid?
            expect(company.errors[:address_city]).to include("は45文字以内で入力してください")
        end
        it "address_street_numberは100文字以下" do
            invalid_address_street_number = "a" * 101
            company = build(:company, address_street_number: invalid_address_street_number)
            company.valid?
            expect(company.errors[:address_street_number]).to include("は100文字以内で入力してください")
        end
        it "address_afterは100文字以下" do
            invalid_address_after = "a" * 101
            company = build(:company, address_after: invalid_address_after)
            company.valid?
            expect(company.errors[:address_after]).to include("は100文字以内で入力してください")
        end
        
        it "有効" do
            company = build(:company)
            expect(company).to be_valid
        end
        
    end
end