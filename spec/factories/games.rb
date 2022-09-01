FactoryBot.define do
  factory :game do
    title { Faker::Lorem.characters(number:10) }
    introduction { Faker::Lorem.characters(number:30) }
  end
end