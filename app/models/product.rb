class Product < ApplicationRecord
	has_many :orders
	has_many :comments
	validates :name, presence: true

	scope :with_image, -> { where.not(image_url: [nil, '']) }
	#{ where("image_url IS NOT NULL AND image_url != ''") }

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
