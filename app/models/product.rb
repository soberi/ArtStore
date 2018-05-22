class Product < ApplicationRecord
	has_many :orders
	has_many :comments
	validates :name, presence: true

	#does not work in production env (if attemptimg to use must
	#add scope to _carousel partial and simple_pages_controller
	scope :with_image, -> { where("image_url IS NOT NULL AND image_url != ''").limit(4) }
	#{ where.not(image_url: [nil, '']) }
	
	def self.search(search_term)
		if Rails.env.development?
			Product.where("name LIKE ?", "%#{search_term}%")
		else
			Product.where("name ilike ?", "%#{search_term}%")
		end
	end

	def average_rating
		comments.average(:rating).to_f
	end

	def highest_rating_comment
		comments.rating_desc.first&.rating
	end

	def lowest_rating_comment
		comments.rating_asc.first&.rating
	end

end
