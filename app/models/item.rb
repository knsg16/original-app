class Item < ActiveRecord::Base
    validates :name,  presence: true, length: { maximum: 50 }
    validates :price, presence: true
    has_many :delivery_items
    has_many :delivery, through: :delivery_items
end
