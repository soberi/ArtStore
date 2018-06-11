# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def contact_form
		UserMailer.contact_form("john@example.com", "John", "Hey there, sailor!")		
	end

	def welcome
		UserMailer.welcome("john@example.com")
	end

	def order_confirmation
		UserMailer.order_confirmation("john@example.com", "John", "Drache", "10.00€")
	end

end