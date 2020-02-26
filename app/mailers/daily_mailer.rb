class DailyMailer < ApplicationMailer
	def send_when_create
	    mail bcc: User.pluck(:email), subject: "6時半のお知らせ"
	end
end
