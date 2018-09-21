class NotificationMailer < ApplicationMailer
  
  def notify_cancel_expire_date(company)
    @greeting = "契約解除期限が近づいています。"
    
    @company = company
    mail to: "#{@company.email}", subject: "Hello, #{@company.contact_person}"
  
    
  end
end
