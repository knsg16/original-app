class Company < ActiveRecord::Base
    validates :company_name,   presence: true, length: { maximum: 100 }
    validates :office_name,    presence: true, length: { maximum: 45 }
    validates :contact_person, presence: true, length: { maximum: 45 }
    validates :address_prefecture,      presence: true, length: { maximum: 45 }
    validates :address_city,            presence: true, length: { maximum: 45 }
    validates :address_street_number,   presence: true, length: { maximum: 100 }
    validates :address_after,           length: { maximum: 100 }
    validates :email, presence: true, length: { maximum: 100 }, format: { with: /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/, message: "はEmail形式で入力して下さい" }
    # 電話番号：半角ハイフンが必須で、[2〜5桁]-[1〜4桁]-[4桁]の半角数字の形式で入力されているか
    validates :tel, presence: true, format: { with: /\A0(\d{1}-\d{4}|\d{2}-\d{3}|\d{3}-\d{2}|\d{4}-\d{1})-\d{4}\z/, message: "は電話番号形式で入力して下さい" }
    # 郵便番号：半角ハイフンが必須で、[3桁]-[4桁]の半角数字の形式で入力されているか
    validates :postcode,  presence: true, format: { with: /\A(\d{3})-(\d{4})\z/, message: "は郵便番号形式で入力して下さい" }
    belongs_to :contract
    has_one :contract
    
end
