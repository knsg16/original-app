class Delivery < ActiveRecord::Base
    #deliveries_controllerでINT_MAXはどんな時もlimt > amountがfalseになるように。
    INT_MAX = 10000000000
    
    validates :contract_id,   presence: true
    validates :schedule_date, presence: true
    has_many :delivery_items, dependent: :destroy
    has_many :items, through: :delivery_items
    belongs_to :contract
    accepts_nested_attributes_for :delivery_items, allow_destroy: true

    def self.search(search)
        #ここぼっち演算子使えるかな？
        return self.all if search.nil?
        self.joins(:contract, { contract: :company })
            .where("companies.company_name LIKE ?", "%" + sanitize_sql_like(search)+ "%")
    end
    
    def self.calc_amount(delivery_params)
        amount = 0
        arr = delivery_params[:delivery_items_attributes].to_a
        arr.each { |ele| amount += ele[1][:amount].to_i }
        amount
    end
    
    def calc_once_quantity_limit
        contract&.plan&.once_quantity_limit.presence || INT_MAX
    end
end
