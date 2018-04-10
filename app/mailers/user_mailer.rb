class UserMailer < ApplicationMailer
	default from: "soberi.artstore@gmail.com"

	def contact_form(email, name, message)
		@message = message
			mail(from: email,
				to: "sa.obery@gmail.com",
				subject: "A new message from #{name}")
	end

	def thank_you
		@name = params[:name]
		@email = [:email]
		@message = [:message]
		UserMailer.contact_form(@email, @name, @message).deliver_now
	end
end