FactoryBot.define do
	sequence(:name) { |n| 'the lisa mona#{n}' }

	factory :product do
		name 
		description 'a backward rendition of a classic'
		image_url 'painting.jpg'
		medium 'oil paint'
		price 1.00
	end

	factory :comment do
    user_id 1
    body 'it is quite exquisite'
    rating 5
  end
end