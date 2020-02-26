namespace :daily do
	desc "毎日送るメール"
	task :mail do
    	DailyMailer.send_when_create.deliver_now
	end
end
