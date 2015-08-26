FactoryGirl.define do
  factory :user do
    name {Faker::Name::name}
    email {Faker::Internet::free_email}
    cpf {Faker::Number.number(11).to_s}
    birth {Faker::Date.between(2.days.ago, Date.today)}
    password {Faker::Internet::password}
  end
end
