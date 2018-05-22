FactoryBot.define do
	sequence(:email) {|n| "user#{n}@gm.com"}

	factory :user do
		first_name "Ann"
		last_name "Bei"
		email
		password "pizza321"
		admin false
	end
end