FactoryGirl.define do
  factory :occurrence do
    description {Faker::Lorem.paragraph}
    pic {Faker::Avatar.image}
  end
end
