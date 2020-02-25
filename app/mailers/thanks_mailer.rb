class ThanksMailer < ApplicationMailer
	def send_when_create(user)
		@user = user
	    mail to: user.email, subject: "新規登録完了のお知らせ"
	end
end
