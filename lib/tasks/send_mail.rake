namespace :send_mail do
  desc '契約解除受付期限メールを送信する'
  task notify_cancel_expire_date: :environment do
    puts "送信を開始します"
    companies = Company.all

    companies.each_with_index do |company, i|
      NotificationMailer.notify_cancel_expire_date(company).deliver
      puts "#{i}: #{company.company_name}へ送信しました。"
    end
    puts "送信を完了しました"
  end
end