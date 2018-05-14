class SimplePagesController < ApplicationController
  
  def index
  end

  def landing_page
    @products = Product.with_image.limit(4)
    #.select { |product| product.image_url != "" } 
  end

  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	ActionMailer::Base.mail(from: @email, 
  		to: "soberi.artstore@gmail.com", 
  		subject: "A message from #{@name}", 
  		body: @message).deliver_now 
  end

end
