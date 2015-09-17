FactoryGirl.define do
  factory :occurrence do
    description {Faker::Lorem.sentence}
    pic {Faker::Avatar.image}
    user_id nil
    lat nil
    lng nil
    pending false

    factory :invalid_occurrence do
      description nil
    end
  end
end
