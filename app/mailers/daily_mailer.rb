class DailyMailer < ApplicationMailer
	def send_when_create
	    mail bcc: User.pluck(:email), subject: "8時45分のお知らせ"
	end
end
