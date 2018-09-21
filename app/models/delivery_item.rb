class DeliveryItem < ActiveRecord::Base
    validates :amount, presence: true
    belongs_to :delivery
    belongs_to :item
end
