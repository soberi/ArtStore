require 'rails_helper'

describe Product do

	context "when the product has comments" do
	
		let(:product) { Product.create!(name: "pencil") }
		let(:user) { User.create!(first_name: "Bob", last_name: 'Ross', email: "bob@gm.com", password: "pizza123") }
	
		before do
			product.comments.create!(rating: 1, user: user, body: "Awful writing tool!")
			product.comments.create!(rating: 3, user: user, body: "Okay writing tool!")
			product.comments.create!(rating: 5, user: user, body: "Great writing tool!")
		end
	
		it "returns the average rating of all comments" do
			expect(product.average_rating).to eq 3
		end
	
		it "is not valid without a name" do
			expect(Product.new(description: "nice pic")).not_to be_valid
		end
	
		it "returns highest rating of all comments" do
			expect(product.highest_rating_comment).to eq 5
		end

		it "returns lowest rating of all comments" do
			expect(product.lowest_rating_comment).to eq 1
		end
	end
end



