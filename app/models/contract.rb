class Contract < ActiveRecord::Base
    validates :company_id,      presence: true
    validates :plan_id,         presence: true
    validates :applicated_date, presence: true
    belongs_to :plan
    belongs_to :company
    has_many :deliveries

    def self.with_company_and_plan
      self.joins(:company, :plan)
          .select("contracts.*, 
                   companies.company_id, 
                   companies.company_name, 
                   companies.office_name, 
                   companies.contact_person, 
                   plans.name")
    end
    
    def self.with_company
      self.joins(:company).select("contracts.id, companies.company_name")
    end
end
