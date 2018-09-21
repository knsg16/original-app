class Plan < ActiveRecord::Base
    validates :name,           presence: true
    validates :price,          presence: true
    validates :month_quantity_limit, presence: true
    validates :once_quantity_limit, presence: true
    validates :month_delivery_limit, presence: true
    belongs_to :contract
end
